import 'package:devhyeon_tools/ui/app_bar/dynamic_app_bar.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevHyeon Tools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  final List<Widget> children = <Widget>[
    for (int i = 0; i < 10; i++)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: const Color.fromARGB(255, 255, 201, 197),
          height: 400,
        ),
      )
  ];

  @override
  Widget build(BuildContext context) {
    var layoutType = DeviceInfo.init(context: context).layoutType;
    return MaterialApp(
        home: Scaffold(
          appBar: DynamicAppBar(layoutType: layoutType,).build(),
          body: Center(
            child: Text('Main Content'),
          ),
          drawer: Drawer(
            // 왼쪽에 나타날 네비게이션 바
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Menu Item 1'),
                  onTap: () {
                    // 네비게이션 메뉴를 눌렀을 때의 동작 정의
                    Navigator.pop(context); // Drawer를 닫습니다.
                  },
                ),
                ListTile(
                  title: Text('Menu Item 2'),
                  onTap: () {
                    // 네비게이션 메뉴를 눌렀을 때의 동작 정의
                    Navigator.pop(context); // Drawer를 닫습니다.
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}