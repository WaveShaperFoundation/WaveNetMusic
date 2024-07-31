import 'package:app/pages/library_page.dart';
import 'package:app/pages/my_playlist_page.dart';
import 'package:app/pages/search_page.dart';
import 'package:app/widgets/player_island.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/waveclient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<NavigationItem> _navigationItems = [
    NavigationItem("You", Icons.abc_rounded, Icons.abc_sharp),
    NavigationItem("Search", Icons.search, Icons.search),
    NavigationItem("Library", Icons.library_music, Icons.library_music),
    NavigationItem("Playlist", Icons.playlist_play_rounded, Icons.playlist_add),
  ];

  List<Widget> _navigationPages = [
    Scaffold(
      body: Center(
        child: Text("You"),
      ),
),
    SearchPage(),
    LibraryPage(),
    MyPlaylistPage()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return buildMobile(context);
      },
    );
  }

  Widget buildMobile(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("WaveNet"),
        elevation: 10,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            var waveclient = context.read<WaveClient>();
            waveclient.login("dj", "erik");
          }, icon: Icon(Icons.login_rounded)),
          IconButton(onPressed: (){
            var waveclient = context.read<WaveClient>();
            waveclient.login("sixfour", "dogukan");
          }, icon: Icon(Icons.percent)),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              var titleController = TextEditingController();
              var descriptionController = TextEditingController();
              var dialog = AlertDialog(
                title: Text("Create new playlist"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Title"),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Description"),
                      controller: descriptionController,
                    ),
                  ],
                ),
                actions: [
                  TextButton(onPressed: () {
                     Navigator.pop(context,[titleController.text, descriptionController.text]);
                  }, child: Text("Create")),
                ],
              );

              showDialog(context: context, builder: (context) => dialog,).then((value) {
                if(value != null){
                  print("${'Creating playlist with values '+value[0]} "+value[1]);
                  context.read<WaveClient>().createPlaylist(value[0], value[1]);
                }
              },);

            },
          ),
        ],
      ),
      body: Stack(children: [
        _navigationPages[_selectedIndex],
        Positioned(
          child: PlayerIsland(),
          bottom: 0,
          left: 0,
          right: 0,
        ),
      ]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations:
            _navigationItems.map((e) => e.toBottomNavigationBarItem()).toList(),
      ),
    );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  NavigationItem(this.title, this.icon, this.selectedIcon);

  NavigationRailDestination toRailDestination() {
    return NavigationRailDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: Text(title),
    );
  }

  NavigationDestination toBottomNavigationBarItem() {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: title,
    );
  }
}
