import 'package:flutter/cupertino.dart';

enum LayoutType {
  none,
  compact,
  medium,
  expanded;

  LayoutType getLayoutType({required double deviceWidth}) {
    if (deviceWidth < 600) {
      return LayoutType.compact;
    } else if (deviceWidth < 840) {
      return LayoutType.medium;
    } else {
      return LayoutType.expanded;
    }
  }
}

class DeviceInfo {
  LayoutType layoutType = LayoutType.none;
  DeviceInfo._();

  DeviceInfo.init({required BuildContext context}) {
    var deviceWidth = MediaQuery.of(context).size.width;
    layoutType = layoutType.getLayoutType(deviceWidth: deviceWidth);
  }
}