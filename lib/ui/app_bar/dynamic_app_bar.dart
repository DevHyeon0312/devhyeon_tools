
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class DynamicAppBar extends AppBar {
  final LayoutType layoutType;
  DynamicAppBar({required this.layoutType});

  AppBar? build() {
    switch(layoutType) {
      case LayoutType.compact : {
        return AppBar(
          title: const Text('CompactAppBar'),
        );
      }
      case LayoutType.medium: {
        return AppBar(
          title: const Text('MediumAppBar'),
        );
      }
      default: {
        return AppBar(
          title: const Text('ExpandedAppBar'),
        );
      }
    }
  }
}