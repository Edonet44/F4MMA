import 'package:f4mma/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'screens/screen.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const Map<int, Color> colori = {44: Color.fromARGB(146, 83, 55, 46)};

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        ),
        initialRoute: '/',
        routes: {
          HomeScreen.routeName: (context) => const Welcome1(),
          discoverScreen.routeName: (context) => const discoverScreen(),
          articleScreen.routeName: (context) => articleScreen(),
        });
  }
}
