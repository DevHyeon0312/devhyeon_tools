
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class DynamicAppBar extends AppBar {
  final LayoutType layoutType;
  DynamicAppBar({super.key, required this.layoutType});

  AppBar? build() {
    switch(layoutType) {
      case LayoutType.compact : {
        return null;
      }
      case LayoutType.medium: {
        return AppBar(
          title: null,
        );
      }
      default: {
        return AppBar(
          title: const Text('Flutter Helper'),
        );
      }
    }
  }
}