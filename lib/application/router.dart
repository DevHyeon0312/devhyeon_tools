import 'package:devhyeon_tools/ui/page/component/component_page.dart';
import 'package:devhyeon_tools/ui/page/component/detail/label_chip_code_page.dart';
import 'package:devhyeon_tools/ui/page/component/detail/label_chip_detail_page.dart';
import 'package:devhyeon_tools/ui/page/profile/profile_page.dart';
import 'package:devhyeon_tools/ui/page/sample/sample_page.dart';
import 'package:devhyeon_tools/ui/page/setting/font/font_page.dart';
import 'package:devhyeon_tools/ui/page/setting/language/language_page.dart';
import 'package:devhyeon_tools/ui/page/setting/setting_page.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String profile = '/profile';
  static const String storage = '/storage';
  static const String component = '/component';
  static const String sample = '/sample';
  static const String setting = '/setting';
  static const String settingFont = '/setting/font';
  static const String settingLanguage = '/setting/language';
  static const String detailLabelChip = '/detail/label_chip';
  static const String codeLabelChip = '/detail/code_chip';
}

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  /// Main Page
  RouteName.profile: (context) => const ProfilePage(),
  RouteName.storage: (context) => const ProfilePage(),
  RouteName.component: (context) => const ComponentPage(),
  RouteName.sample: (context) => const SamplePage(),
  RouteName.setting: (context) => const SettingPage(),
  /// Sub Page
  RouteName.settingFont: (context) => const FontPage(),
  RouteName.settingLanguage: (context) => const LanguagePage(),
  /// Detail Page
  RouteName.detailLabelChip: (context) => const LabelChipDetailPage(),
  /// Code Page
  RouteName.codeLabelChip: (context) => const LabelChipCodePage(),
};