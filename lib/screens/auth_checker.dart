import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/home_screen.dart';
import 'package:f4mma/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/circular_progress_indicator.dart';

///classe UI per la gestione di dello Authstateprovider

class Authck extends ConsumerWidget {
  const Authck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //recupero dell autstateprovider
    final _authState = ref.watch(authStateProvider);
//ritorna come valore :
    return _authState.when(
        data: (user) {
//se utente e diverso da nullo vai a Home altrimenti vai al LogPage
          if (user != null) return const HomeScreen();
          return LoginPage();
        },
        error: (e, trace) => LoginPage(),
        //pagina di caricamento
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
