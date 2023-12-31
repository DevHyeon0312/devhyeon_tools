import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:devhyeon_tools/ui/page/setting/widget/setting_list_item_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SettingListItemWidget(
                icon: Icon(
                    Icons.language
                ),
                title: context.getLocaleString(LocaleString.settingsLanguage),
                onClickItem: () {
                  Navigator.pushNamed(context, RouteName.settingLanguage);
                },
              ),
              SettingListItemWidget(
                icon: Icon(
                    Icons.font_download
                ),
                title: context.getLocaleString(LocaleString.settingsFont),
                onClickItem: () {  },
              ),
            ]
        ),
      ),
    );
  }
}