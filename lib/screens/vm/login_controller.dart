import 'package:f4mma/providers/users/user_provider.dart';
import 'package:f4mma/screens/vm/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
///La classe ha un costruttore che prende come parametro un oggetto [Ref] e inizializza lo stato della schermata di login come "LoginStateInitial()".
///Il metodo "login" prende come parametro una stringa "email" e una stringa "password", imposta lo stato della schermata di login come "LoginStateLoading()" e quindi tenta di effettuare il login dell'utente chiamando il metodo "signInWithEmailAndPassword" dell'oggetto "authRepositoryProvider".
/// Se il login ha successo, lo stato della schermata di login viene impostato su [LoginStateSuccess()].
///In caso di errore, lo stato viene impostato su "LoginStateError(e.toString())", dove "e" è l'eccezione generata dall'operazione di login.
//Il metodo "signOut" chiama il metodo "signOut" dell'oggetto [authRepositoryProvider] per effettuare il logout dell'utente.
///

class LoginController extends StateNotifier<LoginState> {
  //al livello costruttore il login ha uno stato initial
  LoginController(this.ref) : super(const LoginStateInitial());

//inizializzo una variabile di tipo REF di riverpod
//An object used by providers to interact with other providers and the life-cycles of the application.
  final Ref ref;

//login mail password
  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      //leggo i dati dal repositoryprovider
      await ref
          .read(authRepositoryProvider)
          .SingInWithEmailAndPassword(email, password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

//login con google
  void login_withGoogle() async {
    state = const LoginStateLoading();
    try {
      ref.read(authRepositoryProvider).SingInWithGoogle();
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

//log out
  void signOut() async {
    await ref.read(authRepositoryProvider).singOut();
  }
}

///
///la variabile "loginControllerProvider" è un "StateNotifierProvider" che fornisce un'istanza della classe "LoginController" e lo stato iniziale "LoginStateInitial()".
/// Questa variabile può essere utilizzata in altre parti del codice per accedere all'istanza di "LoginController" e al suo stato.
///
final LoginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
        (ref) => LoginController(ref));
