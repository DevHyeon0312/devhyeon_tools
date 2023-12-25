import 'package:devhyeon_tools/ui/page/component/component_page.dart';
import 'package:devhyeon_tools/ui/page/component/detail/label_chip_detail_page.dart';
import 'package:devhyeon_tools/ui/page/profile/profile_page.dart';
import 'package:devhyeon_tools/ui/page/sample/sample_page.dart';
import 'package:devhyeon_tools/ui/page/storage/storage_page.dart';
import 'package:flutter/material.dart';

class RouteName {
  // static const String home = '/';
  static const String storage = '/storage';
  static const String component = '/component';
  static const String sample = '/sample';
  static const String profile = '/profile';
  static const String detailLabelChip = '/detail/label_chip';
}

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  // RouteName.home: (context) => const StoragePage(),
  RouteName.storage: (context) => const StoragePage(),
  RouteName.component: (context) => const ComponentPage(),
  RouteName.sample: (context) => const SamplePage(),
  RouteName.profile: (context) => const ProfilePage(),
  RouteName.detailLabelChip: (context) => const LabelChipDetailPage(),
};