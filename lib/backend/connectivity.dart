import 'package:connectivity/connectivity.dart';

Future<void> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    print('Nessuna connessione di rete!');
  } else {
    print('Connessione di rete attiva!');
  }
}
