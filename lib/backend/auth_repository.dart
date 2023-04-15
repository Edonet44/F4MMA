import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'error_handle.dart';


// vedere questo https://github.com/dev-tayy/fuzzy-eureka/tree/master/lib per la gestione errori e il repository

class AuthRepository {
  final FirebaseAuth _auth;
  //restituisce uno stream di oggeti User
  ////// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out) and also token refresh events.
  //variabile per accesso utente con google
  final GoogleSignIn _googleSignIn;
  static late AuthStatus _status;
  //successivamente provare ad inserire anche il log con microsoft
  //final MicrosoftAuthProvider _microsoftAuthCredential;

//è un metodo che restituisce uno stream di valori di tipo User?.
  Stream<User?> get authStateChange => _auth.idTokenChanges();
//authstateChange restituisce uno stream
  Stream<User?> get userStream => _auth.authStateChanges();
  //costruttore
  AuthRepository(this._auth, this._googleSignIn);

//utente che si logga con mail e password
  Future<User?> SingInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Utente non trovato');
      }
      if (e.code == 'wrong-password') {
        throw AuthException('Password sbagliata');
      } else {
        throw AuthException('Errore. provare nuovamente.');
      }
    }
  }

//minuto 39.28 https://www.youtube.com/watch?v=B8Sx7wGiY-s&t=2160s
  //utente che si logga con gmail
  //mi raccomando quando si crea questo tipo di login con google di avere entrambe le certificazioni sh1 e sh256
  //altrimenti da errore
  void SingInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//passa le credenziali ad UserCredential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Utente Google non trovato');
      }
      if (e.code == 'wrong-password') {
        throw AuthException('Password sbagliata');
      } else {
        throw AuthException('Errore. provare nuovamente.');
      }
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

Future<AuthStatus>update_User({required String email}) async{
await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
}


  //utente che esce dal login
  Future<void> singOut() async {
    await _auth.signOut();
  }
  
}

//classe per gestire le eccezioni
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
