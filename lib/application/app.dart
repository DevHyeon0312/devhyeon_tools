import 'package:devhyeon_tools/application/navigation_drawer.dart';
import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/locale/locale_code.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          countryCode: 'kr_KR',
          fontFamily: 'Font KR',
        ),
      ],
      initLanguageCode: 'kr',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Brightness currentSystemBrightness = MediaQuery.of(context).platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: currentSystemBrightness == Brightness.dark ? Colors.black : Colors.white,
        statusBarIconBrightness: currentSystemBrightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: currentSystemBrightness == Brightness.dark ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness: currentSystemBrightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationDrawerWidget(),
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: currentSystemBrightness == Brightness.dark ? Colors.black87 : Colors.white,
          foregroundColor: currentSystemBrightness == Brightness.dark ? Colors.white : Colors.black87,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: currentSystemBrightness == Brightness.dark ? Colors.black : Colors.white,
            statusBarIconBrightness: currentSystemBrightness == Brightness.dark ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: currentSystemBrightness == Brightness.dark ? Colors.black : Colors.white,
            systemNavigationBarIconBrightness: currentSystemBrightness == Brightness.dark ? Brightness.light : Brightness.dark,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 60,
          backgroundColor: currentSystemBrightness == Brightness.dark ? Colors.black87 : Colors.white12,
          indicatorColor: Colors.transparent,
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return Colors.transparent;
              }
          ),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.selected)) {
                  if (currentSystemBrightness == Brightness.dark) {
                    return const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 0.5,
                    );
                  } else {
                    return const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      height: 0.5,
                    );
                  }
                } else {
                  if (currentSystemBrightness == Brightness.dark) {
                    return const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      height: 0.5,
                    );
                  } else {
                    return const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      height: 0.5,
                    );
                  }
                }
              },
          ),
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) || states.contains(MaterialState.selected)) {
                  if (currentSystemBrightness == Brightness.dark) {
                    return const IconThemeData(
                      color: Colors.white,
                    );
                  } else {
                    return const IconThemeData(color: Colors.black);
                  }
                } else {
                  if (currentSystemBrightness == Brightness.dark) {
                    return const IconThemeData(color: Colors.grey);
                  } else {
                    return const IconThemeData(color: Colors.grey);
                  }
                }
              }
          ),
        )
      ),
      routes: appRoutes,
      localizationsDelegates: _localization.localizationsDelegates,
      supportedLocales: _localization.supportedLocales,
    );
  }
}