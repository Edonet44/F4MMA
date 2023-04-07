import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  //restituisce uno stream di oggeti User
  ////// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out) and also token refresh events.
  //variabile per accesso utente con google
  final GoogleSignIn _googleSignIn;
  //successivamente provare ad inserire anche il log con microsoft
  //final MicrosoftAuthProvider _microsoftAuthCredential;

  Stream<User?> get authStateChange => _auth.idTokenChanges();
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
  Future<User?> SingInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
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
