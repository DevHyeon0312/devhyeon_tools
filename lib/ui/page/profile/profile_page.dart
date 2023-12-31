import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/locale/locale_code.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  void updateTranslate() async {
    Future.delayed(
      Duration(seconds: 2),
        () {
          _localization.translate(LocalCode.korea, save: false);
        }
    );
  }

  @override
  void initState() {
    super.initState();
    // _localization.translate(LocalCode.english, save: false);
    // updateTranslate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset('assets/images/profile.jpeg'),
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: 320,
                  child: Text(
                    context.getLocaleString(LocaleString.profileUserName),
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 320,
                  child: Text(
                    context.getLocaleString(LocaleString.profileUserNickName),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: 320,
                  child: Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 8,),
                      Text(
                        context.getLocaleString(LocaleString.profileCompany),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: 320,
                  child: Row(
                    children: [
                      const Icon(Icons.location_pin),
                      const SizedBox(width: 8,),
                      Text(
                        context.getLocaleString(LocaleString.profileLocation),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: 320,
                  child: Row(
                    children: [
                      const Icon(Icons.email),
                      const SizedBox(width: 8,),
                      Text(
                        context.getLocaleString(LocaleString.profileEmail),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
