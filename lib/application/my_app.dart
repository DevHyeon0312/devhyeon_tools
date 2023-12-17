import 'package:devhyeon_tools/config/colors.dart';
import 'package:devhyeon_tools/ui/app_bar/dynamic_app_bar.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NavigationDrawerApp();
    // MaterialApp(
    //   title: 'DevHyeon Tools',
    //   theme: ThemeData.light(
    //       useMaterial3: true
    //   ),
    //   darkTheme: ThemeData.dark(
    //       useMaterial3: true
    //   ),
    //   themeMode: ThemeMode.dark,
    //   home: const MyHomePage(),
    // );
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'Messages', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
  ExampleDestination(
      'Profile', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
  ExampleDestination(
      'Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerExample(),
    );
  }
}

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Page Index = $screenIndex'),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map(
              (ExampleDestination destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations: destinations.map(
                      (ExampleDestination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  },
                ).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index = $screenIndex'),
                  ElevatedButton(
                    onPressed: openDrawer,
                    child: const Text('Open Drawer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
                (ExampleDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedTab = 0;

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.5, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.bounceIn,
        parent: _animationController,
      ),
    );
  }

  bool isSubMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    var currentTheme = Theme.of(context);
    var layoutType = DeviceInfo.init(context: context).layoutType;
    switch(layoutType) {
      case LayoutType.expanded: {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 100),
                  color: Colors.orange,
                  child: MouseRegion(
                    onEnter: (onEnter) {
                      setState(() {
                        isSubMenuVisible = false;
                        if (isSubMenuVisible) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      });
                    },
                    child: Center(
                      child: Text('Main Content'),
                    ),
                  )
              ),
              isSubMenuVisible ? SlideTransition(
                position: _animation,
                child: Container(
                  width: 200,
                  color: ThemeColor.getDrawerBackground(themeMode: ThemeMode.dark),
                  child: Center(
                    child: Text(
                      'Slide Transition Widget',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ) : Container(),
              Container(
                color: Colors.blue,
                width: 100,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (onEnter) {
                          setState(() {
                            isSubMenuVisible = true;
                            if (isSubMenuVisible) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          });
                        },
                        child: ListTile(
                          title: Text('Menu Item 1'),
                          onTap: () {
                          },
                        )
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (onEnter) {
                          setState(() {
                            isSubMenuVisible = false;
                            if (isSubMenuVisible) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          });
                        },
                        child: ListTile(
                          title: Text('Menu Item 1'),
                          onTap: () {
                          },
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      default: {
        return Scaffold(
          appBar: DynamicAppBar(layoutType: layoutType,).build(),
          body: Center(
            child: Text('Main Content'),
          ),
          drawer: Drawer(
            // 왼쪽에 나타날 네비게이션 바
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Menu Item 1'),
                  onTap: () {
                    // 네비게이션 메뉴를 눌렀을 때의 동작 정의
                    Navigator.pop(context); // Drawer를 닫습니다.
                  },
                ),
                ListTile(
                  title: Text('Menu Item 2'),
                  onTap: () {
                    // 네비게이션 메뉴를 눌렀을 때의 동작 정의
                    Navigator.pop(context); // Drawer를 닫습니다.
                  },
                ),
              ],
            ),
          ),
        );
      }
    }
  }
}