import 'package:app/models/database/app_database.dart';
import 'package:app/models/server_models.dart';
import 'package:app/pages/home_pages/home_page.dart';
import 'package:app/pages/launch_pages/credentials_page.dart';
import 'package:app/pages/launch_pages/host_search_page.dart';
import 'package:app/services/waveclient.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final router = GoRouter(

    routes: [
      GoRoute(
        path: "/hostSearch",
        builder: (context, state) => const HostSearchPage(),
      ),
      GoRoute(
        path: "/credentials",
        builder: (context, state) =>
            CredentialsPage(savedServer: state.extra as SavedServer),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
        redirect: (context, state) async {
          if(kDebugMode){
            print("Redirecting to ${state.uri}");
          }
          final prefs = await SharedPreferences.getInstance();
          int lastUsedConnectionId = prefs.getInt("lastUsedConnectionId") ?? 0;
          if (lastUsedConnectionId != -1) {}
          var appDatabase = context.read<AppDatabase>();
          var connections =
          await appDatabase.select(appDatabase.connectionInstances).get();
          if (kDebugMode) {
            print("Connections: $connections");
          }
          if (lastUsedConnectionId == -1 && connections.isEmpty) {
            return "/hostSearch";
          } else {
            print("Creating WaveClient");
            var waveClient = context.read<WaveClient>();
            var connection = connections.firstWhere((element) => element.id == lastUsedConnectionId);
            waveClient.changeHost(connection.host, connection.serverPort, 3000);
            waveClient.setToken(connection.authToken);
            return "/";
          }
        },
      )
    ]);
