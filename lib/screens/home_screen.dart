import 'package:flutter/material.dart';
import '../widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
        ),
        bottomNavigationBar: const BottomNavBar(index: 0),
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
