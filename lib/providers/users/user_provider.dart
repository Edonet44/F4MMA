import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../backend/auth_repository.dart';

//inizializzo il provider per FIREBASE
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});
//RICHIAMO LA CLASSE STREAM PASSANDOGLI UN GENERICO IN QUESTO CASO IL MODELLO USER DI FIREBASE
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});
//per capire bene bisogna vedere il costruttore:
///
///NB:
///
/*StreamProvider(
    this._createFn, {   ----------->> questa è la funzione che richiama la funzione final Stream<T> Function(StreamProviderRef<T> ref) _createFn;
    super.name,
    super.dependencies,
    @Deprecated('Will be removed in 3.0.0') super.from,
    @Deprecated('Will be removed in 3.0.0') super.argument,
    @Deprecated('Will be removed in 3.0.0') super.debugGetCreateSourceHash,
  }) : super(
          allTransitiveDependencies:
              computeAllTransitiveDependencies(dependencies),
        );
*/

/// quindi quando arrivo a ((ref)  praticamente sto richiamando una funzione che definisce una variabile _createFn che 
/// prende come parametro un StreamProviderRef e restituisce un oggetto generico di tipo STReam.
/// 
/// La stessa cosa accade a alla classe Provider che richiama un costruttore che fa la medesima
///
///
///NB:
/// in questo caso non ho da creare il modello ovvero la classe perchè FIREBASE ha gia la sua classe preconfigurata 
///per l utente ovvero <User?>, in un altro caso per la gestione del provider dovrò creare il mio modello
///

/// A user account.
/*
class User {
  UserPlatform _delegate;

  final FirebaseAuth _auth;
  MultiFactor? _multiFactor;

  User._(this._auth, this._delegate) {
    UserPlatform.verify(_delegate);
  }

  /// The users display name.
  ///
  /// Will be `null` if signing in anonymously or via password authentication.
  String? get displayName {
    return _delegate.displayName;
  }

  /// The users email address.
  ///
  /// Will be `null` if signing in anonymously.
  String? get email {
    return _delegate.email;
  }

  /// Returns whether the users email address has been verified.
  ///
  /// To send a verification email, see [sendEmailVerification].
  ///
  /// Once verified, call [reload] to
  /// .... code continued ....*/
  /// 
  /// 
  /// QUINDI RIEPILOGANDO 
  /// 1 CREAZIONE DEL REPOSITORY CHE SI CONNETTE A UNA BASE DI DATI O API O FILE
  /// 2 MODELLO QUINDI CLASSE 
  /// 3 INIZIALIZZAZIONE DEI PROVIDERS CON RICHIAMO DELLA CLASSE
  /// 4 GESTIONE DELLA UI 