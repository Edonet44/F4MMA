import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/vm/Login/login_state.dart';
import 'package:f4mma/screens/vm/Register/register_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final SignUpProvider = StateNotifierProvider<RegisterController, RegisterState>(
  (ref) => RegisterController(ref));


class RegisterController extends StateNotifier<RegisterState> {
RegisterController(this._ref) : super(const RegisterStateInitial());

  final Ref _ref;

        //registrazione 
          Future<void> register(String email, String password) async {
            state = const RegisterStateLoading();
            try {
                await _ref
                        .read(authRepositoryProvider)
                        .signUp(email: email, password: password);
            state = const RegisterStateSuccess();
          } catch (e) {
              state=RegisterStateError(e.toString());
          }
        }
      }
