import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

extension ContextExtension on BuildContext {
  String getLocaleString(String key) {
    return formatString(
      key,
      [],
    );
  }
}