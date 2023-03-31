import 'package:connectivity/connectivity.dart';

Future<void> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    print('Nessuna connessione di rete!');

    //attivare il blocco dell applicazione un po come fa tinder sulla geolocalizzazione
  } else {
    print('Connessione di rete attiva!');
  }
}
