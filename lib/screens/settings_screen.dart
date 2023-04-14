import 'package:flutter/material.dart';
import '../widget/bottom_nav_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
        ),
        bottomNavigationBar: const BottomNavBar(index: 2),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //inserire oggetto
              children: <Widget>[],
            )
          ],
        )));
  }
}