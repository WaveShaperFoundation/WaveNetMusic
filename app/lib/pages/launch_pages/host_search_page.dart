import 'package:app/models/server_models.dart';
import 'package:app/pages/launch_pages/credentials_page.dart';
import 'package:app/services/waveclient.dart';
import 'package:app/widgets/logo_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HostSearchPage extends StatefulWidget {
  const HostSearchPage({super.key});

  @override
  State<HostSearchPage> createState() => _HostSearchPageState();
}

class _HostSearchPageState extends State<HostSearchPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _hostnameController = TextEditingController();
  final TextEditingController _serverPort = TextEditingController();
  final TextEditingController _streamingPort = TextEditingController();
  bool _revealManualInput = false;

  @override
  void initState() {
    _serverPort.text = "50051";
    _streamingPort.text = "3000";
    _hostnameController.text = "meidling.duckdns.org";
    if (kDebugMode) {
      _hostnameController.text = "192.168.0.88";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _revealManualInput
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _revealManualInput = !_revealManualInput;
                    });
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                  key: ValueKey(_revealManualInput))
              : null,
        ),
      ),
      body: Padding(
        key: const ValueKey<int>(0),
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Material(
              color: Colors.transparent,
              child: WaveLogo(
                style: TextStyle(fontSize: 80),
              ),
            ),
            AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: !_revealManualInput
                    ? Column(
                        children: [
                          const CircularProgressIndicator(),
                          Text("Searching for hosts locally",
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    : Container()),
            AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: _revealManualInput
                    ? Column(
                        children: buildManualInputWidgets(),
                      )
                    : Container()),
            const SizedBox(
              height: 16,
            ),
            IconButton.filledTonal(
                onPressed: continueToCredentials,
                icon: AnimatedRotation(
                  turns: !_revealManualInput ? 0.25 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(Icons.navigate_next_rounded),
                )),
          ],
        ),
      ),
    );
  }

  void continueToCredentials() {
    if (_revealManualInput) {
      if (_hostnameController.text.isEmpty ||
          _serverPort.text.isEmpty ||
          _streamingPort.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill in all fields")));
        return;
      }
      var waveclient = context.read<WaveClient>();
      waveclient.changeHost(_hostnameController.text,
          int.parse(_serverPort.text), int.parse(_streamingPort.text));

      GoRouter.of(context).push("/credentials",
          extra: SavedServer(
            id: -1,
            hostname: _hostnameController.text,
            serverPort: int.parse(_serverPort.text),
            streamingPort: int.parse(_streamingPort.text),
          ));
    } else {
      setState(() {
        _revealManualInput = !_revealManualInput;
      });
    }
  }

  Widget getBottomIcon() {
    return _revealManualInput
        ? const Icon(
            Icons.navigate_next_rounded,
            key: ValueKey("enter"),
          )
        : const Icon(
            Icons.input_rounded,
            key: ValueKey("showManual"),
          );
  }

  List<Widget> buildManualInputWidgets() {
    return [
      TextField(
        controller: _hostnameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Server address",
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      TextField(
        controller: _serverPort,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Server port",
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      TextField(
        controller: _streamingPort,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Streaming port",
        ),
      ),
    ];
  }
}
