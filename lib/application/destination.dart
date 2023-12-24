import 'package:devhyeon_tools/ui/page/component/component_page.dart';
import 'package:devhyeon_tools/ui/page/profile/profile_page.dart';
import 'package:devhyeon_tools/ui/page/sample/sample_page.dart';
import 'package:devhyeon_tools/ui/page/storage/storage_page.dart';
import 'package:flutter/material.dart';

abstract class Destination {
  const Destination({
    required this.index,
    required this.routeName,
    required this.page,
    required this.label,
  });
  final int index;
  final String routeName;
  final Widget page;
  final String label;
}

class MainDestination extends Destination {
  const MainDestination({
    required int index,
    required String routeName,
    required Widget page,
    required String label,
    required this.defaultIcon,
    required this.selectedIcon,
    required this.subItems,
  }) : super(
    index: index,
    routeName: routeName,
    page: page,
    label: label,
  );

  final Widget defaultIcon;
  final Widget selectedIcon;
  final List<SubDestination> subItems;
}

class SubDestination extends Destination {
  const SubDestination({
    required int index,
    required String routeName,
    required Widget page,
    required String label,
  }) : super(
    index: index,
    routeName: routeName,
    page: page,
    label: label,
  );
}

const List<MainDestination> destinations = <MainDestination>[
  MainDestination(
    index: 0,
    routeName: '',
    page: StoragePage(),
    label: 'Storage',
    defaultIcon: Icon(Icons.sd_storage_outlined),
    selectedIcon:Icon(Icons.sd_storage),
    subItems: [],
  ),
  MainDestination(
    index: 1,
    routeName: '',
    label: 'Component',
    page: ComponentPage(),
    defaultIcon: Icon(Icons.widgets_outlined),
    selectedIcon:Icon(Icons.widgets),
    subItems: [
      SubDestination(
        index: 0,
        routeName: '',
        page: Placeholder(),
        label: 'TextView',
      ),
      SubDestination(
        index: 1,
        routeName: '',
        page: Placeholder(),
        label: 'Chip',
      ),
    ],
  ),
  MainDestination(
    index: 2,
    routeName: '',
    label: 'Sample',
    page: SamplePage(),
    defaultIcon: Icon(Icons.account_balance_wallet_outlined),
    selectedIcon:Icon(Icons.account_balance_wallet),
    subItems: [],
  ),
  MainDestination(
    index: 3,
    routeName: '',
    page: ProfilePage(),
    label: 'Profile',
    defaultIcon: Icon(Icons.account_circle_outlined),
    selectedIcon:Icon(Icons.account_circle),
    subItems: [],
  ),
];