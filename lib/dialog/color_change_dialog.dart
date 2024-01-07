import 'package:devhyeon_tools/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorChangeDialog extends StatefulWidget {
  const ColorChangeDialog(
      {super.key,
        required this.title,
        required this.description,
        required this.onClickCancel,
        required this.onClickApply});

  final String title;
  final String description;
  final VoidCallback onClickCancel;
  final ValueChanged<Color> onClickApply;

  @override
  State<ColorChangeDialog> createState() => _ColorChangeDialogState();
}

class _ColorChangeDialogState extends State<ColorChangeDialog> {
  Color selectColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      backgroundColor: ThemeColor.getDialogBackgroundColor(context: context),
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: ThemeColor.getAppForegroundColor(context: context),
      ),
      contentTextStyle: TextStyle(
        fontSize: 18,
        color: ThemeColor.getAppForegroundColor(context: context),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.description),
            HueRingPicker(
              pickerColor: selectColor,
              onColorChanged: (changeColor) {
                setState(() {
                  selectColor = changeColor;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.onClickCancel,
          child: Text(
            'cancel',
            style: TextStyle(
              fontSize: 16,
              color: ThemeColor.getAppForegroundColor(context: context),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onClickApply(selectColor);
          },
          child: Text(
            'apply',
            style: TextStyle(
              fontSize: 16,
              color: ThemeColor.getAppForegroundColor(context: context),
            ),
          ),
        ),
      ],
    );
  }
}
