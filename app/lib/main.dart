import 'package:app/models/database/app_database.dart';
import 'package:app/routes.dart';
import 'package:app/services/waveclient.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 15));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return AppDatabase();
        },),
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
            //lightColorScheme = lightColorScheme.copyWith(secondary: Colors.green);
            // (Optional) If applicable, harmonize custom colors.

            // Repeat for the dark color scheme.
            darkColorScheme = darkDynamic.harmonized();
            //darkColorScheme = darkColorScheme.copyWith(secondary: Colors.green);
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

          return MaterialApp.router(
            title: 'WaveNet',
            themeMode: ThemeMode.system,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              sliderTheme: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(
                      elevation: 3, enabledThumbRadius: 7)),
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              sliderTheme:
                  SliderThemeData(overlayShape: SliderComponentShape.noThumb),
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
