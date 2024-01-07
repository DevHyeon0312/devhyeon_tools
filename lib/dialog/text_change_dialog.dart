import 'package:devhyeon_tools/config/colors.dart';
import 'package:flutter/material.dart';

class TextChangeDialog extends StatefulWidget {
  const TextChangeDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.onClickCancel,
      required this.onClickApply});

  final String title;
  final String description;
  final VoidCallback onClickCancel;
  final ValueChanged<String> onClickApply;

  @override
  State<TextChangeDialog> createState() => _TextChangeDialogState();
}

class _TextChangeDialogState extends State<TextChangeDialog> {
  var inputText = '';

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
            TextField(
              textCapitalization: TextCapitalization.words,
              cursorColor: ThemeColor.getAppForegroundColor(context: context),
              style: TextStyle(
                color: ThemeColor.getAppForegroundColor(context: context),
              ),
              onChanged: (text) {
                setState(() {
                  inputText = text;
                });
              },
            )
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
            widget.onClickApply(inputText);
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
