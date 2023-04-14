import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/home_screen.dart';
import 'package:f4mma/screens/screen.dart';
import 'package:f4mma/screens/vm/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/circular_progress_indicator.dart';

///classe UI per la gestione di dello Authstateprovider

// class Authck extends ConsumerWidget {
//   const Authck({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //recupero dell autstateprovider
//     final _authState = ref.watch(authStateProvider);
// //ritorna come valore :
//     return _authState.when(
//         data: (user) {
// //se utente e diverso da nullo vai a Home altrimenti vai al LogPage
//           // if (user != null) return const HomeScreen();
//           // return LoginPage();

// if (user != null){
//   Future.delayed(Duration(seconds: 2)).then((_) {
//     return Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   });
// }else{
//   Future.delayed(Duration(seconds: 2)).then((_) {
//     return Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   });
//   // return LoginPage();

// }

//         },
//         error: (e, trace) => LoginPage(),
//         //pagina di caricamento
//         loading: () => const SplashScreen());
//   }
// }


///Classe che utilizza lo [StreamProvider] nella cartella providers/user/user_provider.dart
/// e se utente è diverso da nullo -> vai ad HomeScreen
///         altrimenti -> vai a LoginPage
///
///nb notare che il watch dentro lo scaffold
///


class Authck extends ConsumerWidget {
  const Authck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //richiamo dello StreamProvider nel file Userprovider.dart
    final _authState = ref.watch(authStateProvider);

    return _authState.when(
        data: (user) {
          if (user != null) {
            Future.delayed(Duration(seconds: 2)).then((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            });
            return const SplashScreen();
          } else {
            Future.delayed(Duration(seconds: 2)).then((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            });
            return const SplashScreen();
          }
        },
        error: (e, trace) {
          Future.delayed(Duration(seconds: 2)).then((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          });
          return const SplashScreen();
        },
        loading: () => const SplashScreen());
  }
}

//classe che recupera il widget per l'animazone
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TinderAnimation();
  }
}
