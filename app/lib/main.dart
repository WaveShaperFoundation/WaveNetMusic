import 'dart:io';

import 'package:app/pages/home_page.dart';
import 'package:app/pages/launch_page.dart';
import 'package:app/services/audio_handler.dart';
import 'package:app/services/generated/wavenet.pbgrpc.dart';
import 'package:app/services/waveclient.dart';
import 'package:audio_service/audio_service.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:smtc_windows/smtc_windows.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    print("CREATING SMTC OBJECT");
    SMTCWindows? smtc;

    if (Platform.isWindows) {
      smtc = SMTCWindows(
        metadata: const MusicMetadata(
          title: 'No track playing',
          album: 'No album selected',
          albumArtist: 'N/A',
          artist: 'Artist',
          thumbnail:
              'https://media.glamour.com/photos/5f4c44e20c71c58fc210d35f/master/w_2560%2Cc_limit/mgid_ao_image_mtv.jpg',
        ),
        timeline: const PlaybackTimeline(
          startTimeMs: 0,
          endTimeMs: 1000,
          positionMs: 0,
          minSeekTimeMs: 0,
          maxSeekTimeMs: 1000,
        ),
      );
    }

    return MultiProvider(
      providers: [
        Provider<SMTCWindows?>(
          create: (context) {
            return smtc;
          },
          dispose: (context, smtc) {
            print("Disposing SMTC");
            smtc?.dispose();
          },
        ),
        FutureProvider<WaveAudioHandler>(
          create: (context) async {
            print("Creating WaveAudioHandler");
            return await AudioService.init<WaveAudioHandler>(
              builder: () =>
                  WaveAudioHandler(player: player, loaded: true, smtc: smtc),
              config: const AudioServiceConfig(
                androidNotificationChannelId: 'com.wave.net.app',
                androidNotificationChannelName: 'WaveNet',
                androidNotificationIcon: 'mipmap/ic_stat_wave_svg_borderless',
                androidStopForegroundOnPause: true,
                androidNotificationOngoing: true,
                androidNotificationChannelDescription:
                    'This is the WaveNet notification media player channel responsible for playing your music',
              ),
            );
          },
          initialData: WaveAudioHandler(player: player, smtc: smtc),
        ),
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
            lightColorScheme =
                lightColorScheme.copyWith(secondary: Colors.green);
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
              sliderTheme:
                  SliderThemeData(overlayShape: SliderComponentShape.noThumb),
            ),
            home: const LaunchPage(),
          );
        },
      ),
    );
  }
}
