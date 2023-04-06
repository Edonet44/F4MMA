import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  //restituisce uno stream di oggeti User
  ////// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out) and also token refresh events.

  Stream<User?> get authStateChange => _auth.idTokenChanges();
  AuthRepository(this._auth);
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
