import 'package:flutter/material.dart';

class SettingListItemWidget extends StatefulWidget {
  const SettingListItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onClickItem,
  });

  final Icon icon;
  final String title;
  final VoidCallback onClickItem;

  @override
  State<SettingListItemWidget> createState() => _SettingListItemWidgetState();
}

class _SettingListItemWidgetState extends State<SettingListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon,
            SizedBox(width: 4,),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 16,
                ),
                textScaler: TextScaler.noScaling,
              ),
            ),
          ],
        ),
        onPressed: () {
          widget.onClickItem.call();
        },
      ),
    );
  }
}