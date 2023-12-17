import 'package:devhyeon_tools/config/colors.dart';
import 'package:devhyeon_tools/ui/app_bar/dynamic_app_bar.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NavigationDrawerApp();
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon, this.subItems);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final List<String> subItems; // 하위 아이템 리스트 추가
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'Component', Icon(Icons.widgets_outlined), Icon(Icons.widgets),
  ['TextView', 'Chip',],),
  ExampleDestination(
    'Style', Icon(Icons.widgets_outlined), Icon(Icons.widgets),
    ['Font', 'Color',],),
  ExampleDestination(
      'Company', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint),
    ['Tictoccroc',],),
  ExampleDestination(
      'Profile', Icon(Icons.settings_outlined), Icon(Icons.settings), [],),
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

  late LayoutType layoutType;

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    layoutType = DeviceInfo.init(context: context).layoutType;
    showNavigationDrawer = layoutType == LayoutType.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold(context);
  }

  Widget buildBottomBarScaffold(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(layoutType: layoutType,).build(),
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
      appBar: DynamicAppBar(layoutType: layoutType,).build(),
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: destinations.map(
                (ExampleDestination destination) {
                  if (destination.subItems.isNotEmpty) {
                    return ExpansionTile(
                      title: Text(
                        destination.label,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      childrenPadding: EdgeInsets.zero,
                      children: destination.subItems.map((subItem) {
                        return ListTile(
                          title: Text(
                              subItem,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            print('Selected SubItem: $subItem');
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return ListTile(
                      title: Text(
                        destination.label,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        print('Selected Item: $destination');
                      },
                    );
                  }
            },
          ).toList(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
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
    );
  }
}