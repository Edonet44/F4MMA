import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/vm/Login/login_state.dart';
import 'package:f4mma/screens/vm/Forgot_password/password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final PassUpdProvider = StateNotifierProvider<PasswordController, PasswordState>(
  (ref) => PasswordController(ref));


class PasswordController extends StateNotifier<PasswordState> {
PasswordController(this._ref) : super(const PasswordStateInitial());

  final Ref _ref;

        //recupero password
          Future<void> update(String email) async {
            state = const PasswordStateLoading();
            try {
                await _ref
                        .read(authRepositoryProvider).update_User(email: email);
                    
            state = const PasswordStateSuccess();
          } catch (e) {
              state=PasswordStateError(e.toString());
          }
        }
      }
