import 'package:devhyeon_tools/config/colors.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
        child: Text(
            'Coming Soon..',
          style: TextStyle(
            fontSize: 20.0,
            color: ThemeColor.getAppForegroundColor(context: context),
          ),
        ),
      ),
    );
  }
}
