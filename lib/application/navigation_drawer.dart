import 'package:devhyeon_tools/application/destination.dart';
import 'package:devhyeon_tools/ui/app_bar/dynamic_app_bar.dart';
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
    scaffoldKey.currentState!.openDrawer();
  }
  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
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
      appBar: DynamicAppBar(layoutType: layoutType,).build(),
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
              label: destination.label,
              icon: destination.defaultIcon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
              enabled: true,
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
                (MainDestination mainDestination) {
              if (mainDestination.subItems.isNotEmpty) {
                return ExpansionTile(
                  title: Text(
                    mainDestination.label,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  childrenPadding: EdgeInsets.zero,
                  children: mainDestination.subItems.map((subDestination) {
                    return ListTile(
                      title: Text(
                        subDestination.label,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        handleScreenChanged(subDestination);
                      },
                    );
                  }).toList(),
                );
              } else {
                return ListTile(
                  title: Text(
                    mainDestination.label,
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
