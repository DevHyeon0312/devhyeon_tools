import 'package:devhyeon_tools/application/navigation_drawer.dart';
import 'package:devhyeon_tools/application/router.dart';
import 'package:flutter/material.dart';

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerWidget(),
      routes: appRoutes,
    );
  }
}