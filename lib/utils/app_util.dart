import 'package:devhyeon_tools/application/router.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html';

import 'package:flutter/foundation.dart';

void windowOpenNamed(BuildContext context, String routeName) {
  if (kIsWeb) {
    window.open('/devhyeon_tools/build/web$routeName', routeName);
  } else {
    Navigator.pushNamed(context, routeName);
  }
}