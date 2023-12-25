import 'package:flutter/material.dart';

class LabelChipDetailPage extends StatefulWidget {
  const LabelChipDetailPage({super.key});

  @override
  State<LabelChipDetailPage> createState() => _LabelChipDetailPageState();
}

class _LabelChipDetailPageState extends State<LabelChipDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Label Chip Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로 가기 기능
          },
        ),
      ),
      body: Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
