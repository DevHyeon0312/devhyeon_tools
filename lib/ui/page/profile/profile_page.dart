import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        alignment: Alignment.center,
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
            SizedBox(height: 8,),
            Container(
              width: 320,
              child: Text(
                '양영현',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              width: 320,
              child: Text(
                'DevHyeon0312',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: 320,
              child: Row(
                children: [
                  Icon(Icons.work),
                  SizedBox(width: 8,),
                  Text('커넥팅더닷츠(째깍악어)')
                ],
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: 320,
              child: Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(width: 8,),
                  Text('Hanam, Gyeonggi-do, South Korea')
                ],
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: 320,
              child: Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 8,),
                  Text('devhyeon0312@gmail.com')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
