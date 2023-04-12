import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/vm/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  final Ref _ref;

  AuthController(this._ref);

  Future<void> register(String email, String password) async {
    final authRepository = _ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password);

    if (authRepository != null) {
      // _ref.read(userProvider).refresh();
      // Navigator.of(_ref.read(navigatorKeyProvider)).pushReplacement(
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    } else {
      // mostrare un messaggio di errore all'utente
    }
  }
}
