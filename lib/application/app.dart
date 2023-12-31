import 'package:devhyeon_tools/application/navigation_drawer.dart';
import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/locale/locale_code.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class NavigationDrawerApp extends StatefulWidget {
  const NavigationDrawerApp({super.key});

  @override
  State<NavigationDrawerApp> createState() => _NavigationDrawerAppState();
}

class _NavigationDrawerAppState extends State<NavigationDrawerApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          LocalCode.english,
          LocaleString.en,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          LocalCode.korea,
          LocaleString.kr,
          countryCode: 'KR',
          fontFamily: 'Font KR',
        ),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerWidget(),
      routes: appRoutes,
      localizationsDelegates: _localization.localizationsDelegates,
      supportedLocales: _localization.supportedLocales,
    );
  }
}