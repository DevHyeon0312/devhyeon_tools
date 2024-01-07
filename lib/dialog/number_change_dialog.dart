import 'package:devhyeon_tools/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberChangeDialog extends StatefulWidget {
  const NumberChangeDialog(
      {super.key,
        required this.title,
        required this.description,
        required this.onClickCancel,
        required this.onClickApply});

  final String title;
  final String description;
  final VoidCallback onClickCancel;
  final ValueChanged<double> onClickApply;

  @override
  State<NumberChangeDialog> createState() => _NumberChangeDialogState();
}

class _NumberChangeDialogState extends State<NumberChangeDialog> {
  var inputNumber = 0.0;

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
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    if (newValue.text.isNotEmpty) {
                      double.parse(newValue.text);
                    }
                    return newValue;
                  } catch (_) {
                    return oldValue;
                  }
                })
              ],
              keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
              cursorColor: ThemeColor.getAppForegroundColor(context: context),
              style: TextStyle(
                color: ThemeColor.getAppForegroundColor(context: context),
              ),
              onChanged: (text) {
                try {
                  var value = double.parse(text);
                  setState(() {
                    inputNumber = value;
                  });
                } catch (_) {}
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
            widget.onClickApply(inputNumber);
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
