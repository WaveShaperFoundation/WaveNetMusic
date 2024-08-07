import 'package:animations/animations.dart';
import 'package:app/pages/home_pages/library_page.dart';
import 'package:app/pages/home_pages/my_playlist_page.dart';
import 'package:app/pages/home_pages/search_page.dart';
import 'package:app/services/waveclient.dart';
import 'package:app/widgets/logo_widget.dart';
import 'package:app/widgets/player_bar.dart';
import 'package:app/widgets/player_island.dart';
import 'package:app/widgets/side_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _selectIndexReverse = false;
  bool _extendedDrawer = false;

  final List<NavigationItem> _navigationItems = [
    NavigationItem("You", Icons.abc_rounded, Icons.abc_sharp),
    NavigationItem("Search", Icons.search, Icons.search),
    NavigationItem("Library", Icons.library_music, Icons.library_music),
    NavigationItem("Playlist", Icons.playlist_play_rounded, Icons.playlist_add),
  ];

  final List<Widget> _navigationPages = [
    const Scaffold(
      body: Center(
        child: Text("You"),
      ),
    ),
    const SearchPage(),
    const LibraryPage(),
    const MyPlaylistPage()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.minWidth > 600) {
        return buildDesktop(context);
      } else {
        return buildMobile(context);
      }
    });
  }

  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 15,
            child: Row(
              children: [
                NavigationRail(
                  extended: _extendedDrawer,
                  selectedIndex: _selectedIndex,
                  leading: GestureDetector(
                    onTap: () {
                      setState(() {
                        _extendedDrawer = !_extendedDrawer;
                      });
                    },
                    child: MouseRegion(
                      key: ValueKey(_extendedDrawer),
                      cursor: SystemMouseCursors.click,
                      child: WaveLogo(
                        fullText: _extendedDrawer,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectIndexReverse = value < _selectedIndex;
                      _selectedIndex = value;
                    });
                  },
                  destinations: _navigationItems
                      .map((e) => e.toRailDestination())
                      .toList(),
                  useIndicator: true,
                  elevation: 10,
                  trailing: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  flex: 5,
                  child: PageTransitionSwitcher(
                    reverse: _selectIndexReverse,
                    transitionBuilder:
                        (child, primaryAnimation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        child: child,
                        fillColor: Colors.transparent,
                      );
                    },
                    child: IndexedStack(
                      key: ValueKey(_selectedIndex),
                      index: _selectedIndex,
                      children: _navigationPages,
                    ),
                  ),
                ),
                const Flexible(
                  child: SidePanel(),
                  flex: 1,
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).dividerColor.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: const Offset(0, -5),
                  )
                ],
                border: Border(
                  left: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(1),
                  ),
                ),
              ),
              child: const PlayerBar(),
            ),
          )
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WaveLogo(
          fullText: true,
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              var titleController = TextEditingController();
              var descriptionController = TextEditingController();
              var dialog = AlertDialog(
                title: const Text("Create new playlist"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: "Title"),
                      controller: titleController,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(hintText: "Description"),
                      controller: descriptionController,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context,
                            [titleController.text, descriptionController.text]);
                      },
                      child: const Text("Create")),
                ],
              );

              showDialog(
                context: context,
                builder: (context) => dialog,
              ).then(
                (value) {
                  if (value != null) {
                    print("${'Creating playlist with values ' + value[0]} " +
                        value[1]);
                    context
                        .read<WaveClient>()
                        .createPlaylist(value[0], value[1]);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Stack(children: [
        PageTransitionSwitcher(
          reverse: _selectIndexReverse,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
              fillColor: Colors.transparent,
            );
          },
          child: IndexedStack(
            key: ValueKey(_selectedIndex),
            index: _selectedIndex,
            children: _navigationPages,
          ),
        ),
        Positioned(
          child: buildSpecialPlayerIsland(),
          bottom: 5,
          left: 4,
          right: 4,
        ),
      ]),
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectIndexReverse = value < _selectedIndex;
            _selectedIndex = value;
          });
        },
        destinations:
            _navigationItems.map((e) => e.toBottomNavigationBarItem()).toList(),
      ),
    );
  }

  Widget buildSpecialPlayerIsland() {
    int opacity = 1;
    if(_selectedIndex == 3) {
      opacity = 0;
    }
    var children = [
      Flexible(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: SizedBox(
            height: Theme.of(context)
                .floatingActionButtonTheme
                .sizeConstraints
                ?.maxHeight,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: PlayerIsland(),
            ),
          ),
        ),
      ),
      AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        opacity: _selectedIndex == 3 ? 1 : 0,
        child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: _selectedIndex == 3
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: buildFloatingActionButton())
                : Container()),
      )
    ];
    return Row(children: children, mainAxisAlignment: MainAxisAlignment.center);
  }

  Widget buildFloatingActionButton() {
    if (_selectedIndex != 3) {
      return Container();
    }
    return FloatingActionButton(
      onPressed: () {
        createNewPlaylistDialog();
      },
      child: Icon(Icons.add_rounded),
    );
  }

  void createNewPlaylistDialog() {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var dialog = AlertDialog(
      title: const Text("Create new playlist"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Description"),
            controller: descriptionController,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(
                  context, [titleController.text, descriptionController.text]);
            },
            child: const Text("Create")),
      ],
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
    ).then(
      (value) {
        if (value != null) {
          print("${'Creating playlist with values ' + value[0]} " + value[1]);
          context
              .read<WaveClient>()
              .createPlaylist(value[0], value[1])
              .then((value) {
            setState(() {
              _selectedIndex = 3;
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Playlist created")));
          });
        }
      },
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
