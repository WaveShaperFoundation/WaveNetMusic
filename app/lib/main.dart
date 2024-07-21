import 'dart:io';

import 'package:app/pages/home_page.dart';
import 'package:app/services/audio_handler.dart';
import 'package:app/services/generated/wavenet.pbgrpc.dart';
import 'package:app/services/waveclient.dart';
import 'package:audio_service/audio_service.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();

    return MultiProvider(
      providers: [
        FutureProvider<WaveAudioHandler>(
            create: (context) async {
              print("Creating WaveAudioHandler");
              return await AudioService.init<WaveAudioHandler>(
                builder: () => WaveAudioHandler(player: player, loaded: true),
                config: AudioServiceConfig(
                  androidNotificationChannelId: 'com.wave.net.app',
                  androidNotificationChannelName: 'WaveNet',
                  androidNotificationIcon: 'mipmap/ic_launcher_foreground',
                  androidStopForegroundOnPause: true,
                  androidNotificationOngoing: true,
                ),
              );
            },
            initialData: WaveAudioHandler(player: player)),
        Provider(
          create: (context) {
            return WaveClient();
          },
        )
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) {

          ColorScheme lightColorScheme;
          ColorScheme darkColorScheme;

          if (lightDynamic != null && darkDynamic != null) {
            // On Android S+ devices, use the provided dynamic color scheme.
            // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
            lightColorScheme = lightDynamic.harmonized();
            // (Optional) Customize the scheme as desired. For example, one might
            // want to use a brand color to override the dynamic [ColorScheme.secondary].
            lightColorScheme = lightColorScheme.copyWith(secondary: Colors.green);
            // (Optional) If applicable, harmonize custom colors.

            // Repeat for the dark color scheme.
            darkColorScheme = darkDynamic.harmonized();
            darkColorScheme = darkColorScheme.copyWith(secondary: Colors.green);

          } else {
            // Otherwise, use fallback schemes.
            lightColorScheme = ColorScheme.fromSeed(
              seedColor: Colors.green,
            );
            darkColorScheme = ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            );
          }

          return MaterialApp(
            title: 'WaveNet',
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              colorScheme: lightColorScheme,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              sliderTheme: SliderThemeData(
                  overlayShape: SliderComponentShape.noThumb
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Album> album = [];

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    try {
      final channel = ClientChannel('localhost',
          port: 50051,
          options: const ChannelOptions(
            userAgent: "Windoof",
            credentials: ChannelCredentials.insecure(),
          ));
      final stub = LibraryClient(channel);

      try {
        var response = stub.getAlbums(Empty());
        response.then((p0) {
          setState(() {
            album.clear();
            album.addAll(p0.albums);
          });
        }).catchError((error) {
          print(error);
        });
      } catch (e) {
        print('Ca asdasdasdught error: $e');
      }
      setState(() {
        _counter++;
      });
    } catch (error) {
      print("Error found ${error.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemBuilder: (context, index) {
            var context = this.album[index];
            return ListTile(
              title: Text(context.name),
            );
          },
          itemCount: this.album.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
