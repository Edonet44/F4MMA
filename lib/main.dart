import 'package:f4mma/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/screen.dart';

// void main() {

//   runApp(const Myapp());

// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: Myapp()));
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
          HomeScreen.routeName: (context) => const HomeScreen(),
          MatchScreen.routeName: (context) => const MatchScreen(),
          articleScreen.routeName: (context) => const articleScreen(),
        });
  }
}
