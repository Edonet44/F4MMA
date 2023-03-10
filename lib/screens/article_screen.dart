import 'package:flutter/material.dart';
import '../widget/bottom_nav_bar.dart';

class articleScreen extends StatelessWidget {
  const articleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Articoli'),
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
