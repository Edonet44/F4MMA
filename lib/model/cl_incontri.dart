import 'dart:convert';
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:f4mma/model/cl_atleta.dart';

import 'cl_api_player.dart';

///Classe per la creazione dei Match
///utlizzo dell'algoritmo Swiss system turnament
///utilizzo dell algoritmo di confronto a curva di probabilità
///
///

class Incontri {
  /// 1 recupero i valori di ogni singolo giocatore dal file players_config.json
  /// 2 creare i match
  /// 3 creare il metodo di confronto
  ///

  //shuffle players

//creo una funzione per il recupero del file .json
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

//crea i match
  void Creamatches(List player) {
    try {
      //istanzio la classe atleti con un array vuoto
      final List<List<Atleti>> matches = [];
      final AtletiManager atleti;

      for (var i = 0; i < player.length; i++) {
        //itero per la lunghezza dell
        final List<Match> roundMatch = [];
      }
    } catch (e) {
      print(e);
    }
  }
}

void main() {
  //testing per recupero dati da file json
  //recupera i valori del file json
  // final String jstring = Match().loadJson().toString();
  // //istanza della classe atleta
  // final AtletiManager atleta = AtletiManager.fromJson(jstring);
  // try {
  //   //stampa il file
  //   print(atleta.nome);
  //   for (final titoli in atleta.titoli) {
  //     print(titoli.titolo);
  //   }
  // } on Exception catch (e) {
  //   print('Errore: $e');
  // }
}

///classe con algoritmo di probabilità che confronta due giocatori in base a dei valori passati
/* import 'dart:math';

class Player {
  String name;
  int strength;
  int defense;
  int magic;

  Player(this.name, this.strength, this.defense, this.magic);
}

void main() {
  Player player1 = Player('Mario', 10, 5, 5);
  Player player2 = Player('Luigi', 8, 7, 4);

  double player1Chance = calculateWinningChance(player1, player2);
  double player2Chance = 1 - player1Chance;

  print('${player1.name} has a ${player1Chance * 100}% chance of winning.');
  print('${player2.name} has a ${player2Chance * 100}% chance of winning.');
}

double calculateWinningChance(Player player1, Player player2) {
  double p1Strength = player1.strength.toDouble();
  double p2Strength = player2.strength.toDouble();

  double p1Prob = p1Strength / (p1Strength + p2Strength);
  double p2Prob = 1 - p1Prob;

  // add some randomness to make the game more interesting
  p1Prob = addRandomness(p1Prob);
  p2Prob = 1 - p1Prob;

  return p1Prob;
}

double addRandomness(double prob) {
  Random rand = Random();
  double minRandomness = 0.05;
  double maxRandomness = 0.2;
  double randomness = minRandomness + (maxRandomness - minRandomness) * rand.nextDouble();
  return prob + (randomness * (rand.nextBool() ? 1 : -1));
}
 */