import 'package:devhyeon_tools/application/destination.dart';
import 'package:devhyeon_tools/config/colors.dart';
import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Destination selectedDestination;
  late int selectedIndex;

  late LayoutType layoutType;

  late bool showNavigationDrawerWidget;

  void handleScreenChanged(Destination destination) {
    setState(() {
      selectedDestination = destination;
      selectedIndex = destination.index;
    });
    closeDrawer();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }

  @override
  void initState() {
    super.initState();
    selectedDestination = destinations[0];
    selectedIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    layoutType = DeviceInfo.init(context: context).layoutType;
    showNavigationDrawerWidget = layoutType == LayoutType.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawerWidget
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold(context);
  }

  Widget buildBottomBarScaffold(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColor.getAppBackgroundColor(context: context),
      body: SafeArea(
          bottom: false,
          top: false,
          child: selectedDestination.page
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          handleScreenChanged(destinations[index]);
        },
        destinations: destinations.map(
              (MainDestination destination) {
            return NavigationDestination(
              label: context.getLocaleString(destination.label),
              icon: destination.defaultIcon,
              selectedIcon: destination.selectedIcon,
              tooltip: null,
              enabled: true,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Helper'),
        foregroundColor: ThemeColor.getAppForegroundColor(context: context),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: ThemeColor.getAppForegroundColor(context: context),
          onPressed: openDrawer,
        ),
      ),
      key: scaffoldKey,
      backgroundColor: ThemeColor.getAppBackgroundColor(context: context),
      drawer: Drawer(
        child: ListView(
          children: destinations.map(
                (MainDestination mainDestination) {
              if (mainDestination.subItems.isNotEmpty) {
                return ExpansionTile(
                  title: Text(
                    context.getLocaleString(mainDestination.label),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  childrenPadding: EdgeInsets.zero,
                  children: mainDestination.subItems.map((subDestination) {
                    return ListTile(
                      title: Text(
                        context.getLocaleString(subDestination.label),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        if (subDestination.routeName.isNotEmpty) {
                          Navigator.pushNamed(context, subDestination.routeName);
                        } else {
                          handleScreenChanged(subDestination);
                        }
                      },
                    );
                  }).toList(),
                );
              } else {
                return ListTile(
                  title: Text(
                    context.getLocaleString(mainDestination.label),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    handleScreenChanged(mainDestination);
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
          child: selectedDestination.page
      ),
    );
  }
}
