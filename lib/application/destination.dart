import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:devhyeon_tools/ui/page/component/component_page.dart';
import 'package:devhyeon_tools/ui/page/profile/profile_page.dart';
import 'package:devhyeon_tools/ui/page/sample/sample_page.dart';
import 'package:devhyeon_tools/ui/page/setting/font/font_page.dart';
import 'package:devhyeon_tools/ui/page/setting/language/language_page.dart';
import 'package:devhyeon_tools/ui/page/setting/setting_page.dart';
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
    page: ProfilePage(),
    label:LocaleString.destinationProfile,
    defaultIcon: Icon(Icons.account_circle_outlined),
    selectedIcon:Icon(Icons.account_circle),
    subItems: [],
  ),
  // MainDestination(
  //   index: 1,
  //   routeName: '',
  //   page: StoragePage(),
  //   label: LocaleString.destinationStorage,
  //   defaultIcon: Icon(Icons.sd_storage_outlined),
  //   selectedIcon:Icon(Icons.sd_storage),
  //   subItems: [],
  // ),
  MainDestination(
    index: 1,
    routeName: '',
    label: LocaleString.destinationComponent,
    page: ComponentPage(),
    defaultIcon: Icon(Icons.widgets_outlined),
    selectedIcon:Icon(Icons.widgets),
    subItems: [],
  ),
  MainDestination(
    index: 2,
    routeName: '',
    label: LocaleString.destinationSample,
    page: SamplePage(),
    defaultIcon: Icon(Icons.account_balance_wallet_outlined),
    selectedIcon:Icon(Icons.account_balance_wallet),
    subItems: [],
  ),
  MainDestination(
    index: 3,
    routeName: '',
    page: SettingPage(),
    label: LocaleString.destinationSettings,
    defaultIcon: Icon(Icons.settings_suggest_outlined),
    selectedIcon:Icon(Icons.settings_suggest),
    subItems: [
      SubDestination(
        index: 0,
        routeName: RouteName.settingLanguage,
        page: LanguagePage(),
        label: LocaleString.subDestinationLanguage,
      ),
      SubDestination(
        index: 1,
        routeName: RouteName.settingFont,
        page: FontPage(),
        label: LocaleString.subDestinationFont,
      ),
    ],
  ),
];