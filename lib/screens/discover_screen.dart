import 'package:flutter/material.dart';
import '../widget/bottom_nav_bar.dart';

class discoverScreen extends StatelessWidget {
  const discoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profilo'),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //inserire oggetto di profilo
              children: <Widget>[],
            )
          ],
        )));
  }
}
