import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

Future<void> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    print('Nessuna connessione di rete!');

ScaffoldMessenger(child: Text('Nessuna connessione di rete'));
    //attivare il blocco dell applicazione un po come fa tinder sulla geolocalizzazione
  } else {
    ScaffoldMessenger(child: Text('Sei connesso alla rete'));
    print('Connessione di rete attiva!');
  }
}
