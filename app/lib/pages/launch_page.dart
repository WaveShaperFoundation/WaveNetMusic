import 'dart:async';

import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'dart:ui' as ui;

import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

import '../services/waveclient.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  int _launch_step = 0;
  String _hostname = "";
  bool _showPassword = false;
  List<InfiniteScrollController> _controllers = [];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _loginStatus = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Every 5 seconds

  }

  Timer? _runningAnimationTimer;

  void startCoverAnimation() {
    if (_runningAnimationTimer != null) {
      stopCoverAnimation();
    }
    setState(() {
      for (var controllerIndex = 1; controllerIndex <= 5; controllerIndex++) {
        InfiniteScrollController controller = InfiniteScrollController();
        _controllers.add(controller);
      }
    });
    var speed = const Duration(seconds: 4);
    animationCallback() {
      print("Animation callback");
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
    Future.delayed(const Duration(milliseconds: 1000), () {
      animationCallback();
    });

    _runningAnimationTimer = Timer.periodic(speed, (timer) {
      animationCallback();
    });
  }

  void stopCoverAnimation() {
    _runningAnimationTimer!.cancel();
    _runningAnimationTimer = null;
    for(var controller in _controllers){
      controller.dispose();
    }
    _controllers.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget page = Container();
    if (_launch_step == 0) {
      page = hostnameInput();
    } else if (_launch_step == 1 || _launch_step == 2) {
      page = buildCredentialsPage();
    }

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: page,
        ),
      ),
    );
  }

  Widget buildCredentialsPage() {

    return Stack(
      clipBehavior: Clip.none,
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
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            onPressed: () {
              setState(() {
                _launch_step = _launch_step - 1;
              });
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Hero(
                  tag: "logo",
                  child: Text(
                    "Wave*",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "PlanetKosmos", fontSize: 64),
                  )),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
                autofillHints: const [AutofillHints.username],
                controller: usernameController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  hintText: "Password",
                  border: const OutlineInputBorder(),
                  suffix: GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: _showPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    onTapDown: (_) {
                      setState(() {
                        _showPassword = true;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        _showPassword = false;
                      });
                    },
                  )
                ),
                obscureText: !_showPassword,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {

                  var waveclient = context.read<WaveClient>();
                  setState(() {
                    _loginStatus = 1;
                  });
                  waveclient.login(usernameController.text, passwordController.text).then((value) {
                    if(value.isNotEmpty){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      },));
                    }else{
                      setState(() {
                        _loginStatus = 2;
                      });
                    }
                  }).catchError((error){
                    setState(() {
                      _loginStatus = 0;
                    });
                  });
                  setState(() {
                    _launch_step = 2;
                  });
                },
                label: _loginStatus == 0?const Text("Login"):(_loginStatus == 1?const Text("Logging in..."):const Text("Error logging in")),
                icon: _loginStatus == 0?const Icon(Icons.login):(_loginStatus == 1?const CircularProgressIndicator():const Icon(Icons.error)),
              ),
            ],
          ),
        )
      ],
    );
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
                  controller, _controllers.indexOf(controller) + 1))
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
        onIndexChanged: (index) {},
        controller: controller,
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Card(
              clipBehavior: Clip.antiAlias,
              child: OctoImage(
                fadeInDuration: const Duration(milliseconds: 1050),
                fit: BoxFit.cover,
                fadeInCurve: Curves.easeIn,
                fadeOutCurve: Curves.easeOut,
                fadeOutDuration: const Duration(milliseconds: 550),
                image:
                    NetworkImage(_hostname + "/cover?id=${itemIndex + offset}"),
                placeholderBuilder: (context) {
                  return Container();
                },
              ));
        },
      ),
    );
  }

  Widget hostnameInput() {
    TextEditingController controller = TextEditingController();
    controller.text = "http://192.168.0.50:3000";
    return Padding(
      key: const ValueKey<int>(0),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
              tag: "logo",
              child: Text(
                "Wave*",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "PlanetKosmos", fontSize: 64),
              )),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Hostname",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _hostname = controller.text;
                _launch_step = 1;
                var waveclient = context.read<WaveClient>();
                waveclient.changeHost(_hostname);
              });
              startCoverAnimation();
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
