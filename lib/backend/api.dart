import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async' show Future;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import '../model/cl_api_player.dart';

class Api {
//GEt .json
  Future<List<Player>?> loadJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/api/players_config.json');
      return playerFromJson(jsonString);
    } catch (e) {
      print(e);
    }
    throw (e);
  }

//il crud dei file in generale delle cartelle flutter non si puo fare e' peemessa solo la lettura.
//altrimenti bisogna creare un file json nello storage di firebase.
//in questo caso posso avere i permessi Crud del file remoto
//Write .json
  //funzione da convertire per il recupero
  // Future<void> writeToJson(List<Giocatore> giocatori) async {
  //   try {
  //     // Converti la lista di Giocatore in Player
  //     final player = Player(
  //       giocatore1: giocatori[0],
  //       giocatore2: giocatori[1],
  //       giocatore3: giocatori[2],
  //       giocatore4: giocatori[3],
  //       giocatore5: giocatori[4],
  //       giocatore6: giocatori[5],
  //       giocatore7: giocatori[6],
  //       giocatore8: giocatori[7],
  //       giocatore9: giocatori[8],
  //       giocatore10: giocatori[9],
  //     );

  //     // Converti Player in JSON e salvalo in un file
  //     final jsonStr = playerToJson([player]);
  //     //final Directory directory = await getApplicationDocumentsDirectory();
  //     final file = File('path/to/file.json');
  //     await file.writeAsString(jsonStr);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

//Delete .json

//Append .json

//fetch api
}

class FirebaseStorageCRUD {
//disabilita i certificati SSL
  // HttpClient httpClient = HttpClient()
  //   ..badCertificateCallback =
  //       ((X509Certificate cert, String host, int port) => true);
  final FirebaseStorage _storage = FirebaseStorage.instance;

//create non utilizzata perche il file e' gia esistente
  Future<String> createFile(String filePath, String fileContent) async {
    try {
      final Reference ref = _storage.ref().child(filePath);
      await ref.putString(fileContent);
      final String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error creating file: $e');
      return "";
    }
  }

//Fetch json file in storage firebase
  // Future<List<Player>?> loadJson_storage() async {
  //   try {
  //     final storageRef = FirebaseStorage.instance
  //         .ref()
  //         .child('gs://f4mma-bce65.appspot.com/players_config.json');
  //     // final data = await storageRef.getData();
  //     // final jsonString = utf8.decode(data!);
  //     // return playerFromJson(jsonString);
  //     final downloadUrl = await storageRef.getDownloadURL();
  //     final response = await http.get(Uri.parse(downloadUrl));
  //     final jsonString = response.body;
  //     return playerFromJson(jsonString);
  //   } catch (e) {
  //     print(e);
  //     throw (e);
  //   }
  // }
  Future<List<Player>?> loadJson_storage() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('gs://f4mma-bce65.appspot.com/players_config.json');

      final downloadUrl = await _getDownloadUrl(storageRef);

      final response = await http.get(Uri.parse(downloadUrl));
      final jsonString = response.body;
      return playerFromJson(jsonString);
    } catch (e) {
      print('Error while loading JSON from Firebase Storage: $e');
      return null;
    }
  }

  Future<String> _getDownloadUrl(Reference ref) async {
    try {
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error while getting download URL from Firebase Storage: $e');
      throw e;
    }
  }

//update
  Future<void> updatePlayerScore(String playerName, int newScore) async {
    final storage = FirebaseStorage.instance;

    try {
      final storageRef = storage.ref().child(playerName + '.json');
      final String url = await storageRef.getDownloadURL();

      final response = await http.get(Uri.parse(url));
      final Map<String, dynamic> playerData = json.decode(response.body);

      playerData['punteggio'] = newScore;

      final updatedData = json.encode(playerData);
      await storageRef.putData(Uint8List.fromList(utf8.encode(updatedData)));
      // await storageRef.putData(utf8.encode(updatedData));

      print('Player score updated successfully!');
    } catch (error) {
      print('Error updating player score: $error');
    }
  }
}
