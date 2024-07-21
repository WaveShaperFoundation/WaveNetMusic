import 'package:app/pages/library_page.dart';
import 'package:app/pages/search_page.dart';
import 'package:app/widgets/PlayerIsland.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<NavigationItem> _navigationItems = [
    NavigationItem("You", Icons.abc_rounded, Icons.abc_sharp),
    NavigationItem("Library", Icons.library_music, Icons.library_music),
    NavigationItem("Search", Icons.search, Icons.search),
  ];

  List<Widget> _navigationPages = [
    LibraryPage(),
    LibraryPage(),
    SearchPage(),
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
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {

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
