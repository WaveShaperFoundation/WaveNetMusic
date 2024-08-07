import 'dart:async';

import 'package:app/models/database/app_database.dart';
import 'package:app/models/server_models.dart';
import 'package:app/services/waveclient.dart';
import 'package:app/widgets/album_cover_card.dart';
import 'package:app/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { Waiting, LoggingIn, Error }

class CredentialsPage extends StatefulWidget {
  final SavedServer savedServer;

  const CredentialsPage({super.key, required this.savedServer});

  @override
  State<CredentialsPage> createState() => _CredentialsPageState();
}

class _CredentialsPageState extends State<CredentialsPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginStatus _loginStatus = LoginStatus.Waiting;
  Timer? _runningAnimationTimer;
  List<InfiniteScrollController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _usernameController.text = "erik";
    _passwordController.text = "backup";
    _controllers = generateControllers(6);
    startCoverAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCredentialsPage(),
    );
  }

  Widget buildCredentialsPage() {
    return Stack(
      clipBehavior: Clip.hardEdge,
      key: const ValueKey<int>(1),
      children: [
        OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: RotationTransition(
                turns: AlwaysStoppedAnimation(0.1),
                child: buildBackgroundOfAlbumCovers())),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Container(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Material(
                  color: Colors.transparent,
                  child: WaveLogo(
                    style: TextStyle(fontSize: 80),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  controller: _usernameController,
                  autofillHints: const [AutofillHints.username],
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  autofillHints: const [AutofillHints.password],
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please enter valid credentials")));
                        return;
                      }
                      onTapLogin();
                    },
                    child: const Text("Login")),
                SizedBox(height: 16),
                if (_loginStatus == LoginStatus.LoggingIn)
                  const LinearProgressIndicator(),
                if (_loginStatus == LoginStatus.Error)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Invalid credentials",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void onTapLogin() async {
    var waveclient = context.read<WaveClient>();
    setState(() {
      _loginStatus = LoginStatus.LoggingIn;
    });

    try {
      var jwtToken = await waveclient.login(
          _usernameController.text, _passwordController.text);
      if (jwtToken.isNotEmpty) {
        stopCoverAnimation();
        var database = context.read<AppDatabase>();
        var saved = await database.into(database.connectionInstances).insert(
            ConnectionInstancesCompanion.insert(
                name: _usernameController.text,
                host: waveclient.hostName,
                serverPort: waveclient.serverPort,
                authToken: jwtToken));
        var prefs = await SharedPreferences.getInstance();
        print("Saved connection id: $saved");
        prefs.setInt("lastUsedConnectionId", saved);
        GoRouter.of(context).pushReplacement("/");
      } else {
        setState(() {
          _loginStatus = LoginStatus.Error;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _loginStatus = LoginStatus.Error;
      });
    }
  }

  Widget buildBackgroundOfAlbumCovers() {
    return Opacity(
      opacity: 1,
      child: SizedBox(
        height: 2000,
        width: 2000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _controllers
              .map((controller) => buildBackgroundCarousel(
                  controller, _controllers.indexOf(controller) * 2 + 1))
              .toList(),
        ),
      ),
    );
  }

  Widget buildBackgroundCarousel(
      InfiniteScrollController controller, int offset) {
    return SizedBox(
      height: 180,
      child: InfiniteCarousel.builder(
        itemCount: 4,
        itemExtent: 180,
        center: true,
        anchor: 0.0,
        velocityFactor: 0.2,
        controller: controller,
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Card(
              clipBehavior: Clip.antiAlias,
              child: AlbumCoverCard(albumId: offset + itemIndex));
        },
      ),
    );
  }

  List<InfiniteScrollController> generateControllers(int count) {
    List<InfiniteScrollController> controllers = [];
    for (var controllerIndex = 1; controllerIndex <= count; controllerIndex++) {
      InfiniteScrollController controller = InfiniteScrollController();
      controllers.add(controller);
    }
    return controllers;
  }

  void startCoverAnimation() {
    if (_runningAnimationTimer != null) {
      stopCoverAnimation();
    }
    var speed = const Duration(seconds: 7);
    animationCallback() {
      bool next = true;
      for (var controller in _controllers) {
        next = !next;
        if (next) {
          controller.nextItem(duration: speed, curve: Curves.linear);
        } else {
          controller.previousItem(duration: speed, curve: Curves.linear);
        }
      }
    }

    //Delays the animation callback
    Future.delayed(const Duration(milliseconds: 100), () {
      animationCallback();
    });

    _runningAnimationTimer = Timer.periodic(speed, (timer) {
      animationCallback();
    });
  }

  void stopCoverAnimation() {
    _runningAnimationTimer?.cancel();
    _runningAnimationTimer = null;
  }

  @override
  void dispose() {
    stopCoverAnimation();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
