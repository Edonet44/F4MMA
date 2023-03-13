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

//1
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

//2   Version con giocatore
  //crea i match
  void Creamatches(List<Giocatore>? giocatori) {
    // var punteggio = 0;
    try {
      //istanzio la classe giocatore con un array vuoto
      final List<List<Giocatore>> matches = [];
      //final AtletiManager atleti;
      //itero per la lunghezza dei giocatori
      for (var i = 0; i < giocatori!.length; i++) {
        //creo una lista per i round
        final List<Giocatore> roundMatches = [];
        //aggiungo alla lista tutti i giocatori
        roundMatches.add(giocatori[i]);
        for (var j = i + 1; j < giocatori.length; j++) {
          roundMatches.add(giocatori[j]);
        }
        matches.add(roundMatches);
        //gioca i match
        for (var i = 0; i < matches.length; i++) {
          print('Round ${i + 1}');
          for (final match in matches[i]) {
            final random = Random();
            final result = random.nextInt(2);
            if (result == 0) {
              match.punteggio++;
              print('${match.nome} vittoria!');
            } else {
              print('${match.nome} sconfitta!');
            }
          }
          //ordina per punteggio
          matches[i].sort((a, b) => b.punteggio.compareTo(a.punteggio));
          //stampa per punteggio
          print('punteggio');
          for (final match in matches[i]) {
            print('${match.nome}${match.punteggio}');
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

/*  void Creamatches(List<Player>? player) {
    var punteggio = 0;
    try {
      //istanzio la classe giocatore con un array vuoto
      final List<List<Player>> matches = [];
      //final AtletiManager atleti;
      //itero per la lunghezza dei giocatori
      for (var i = 0; i < player!.length; i++) {
        //creo una lista per i round
        final List<Player> roundMatches = [];
        //aggiungo alla lista tutti i giocatori
        roundMatches.add(player[i]);
        for (var j = i + 1; j < player.length; j++) {
          roundMatches.add(player[j]);
        }
        matches.add(roundMatches);
        //gioca i match
        for (var i = 0; i < matches.length; i++) {
          print('Round ${i + 1}');
          for (final match in matches[i]) {
            final random = Random();
            final result = random.nextInt(2);
            if (result == 0) {
              //match.punteggio++;
              punteggio++;
              print('${match.nome} vittoria!');
            } else {
              print('${match.nome} sconfitta!');
            }
          }
          //ordina per punteggio
          matches[i].sort((a, b) => b.punteggio.compareTo(a.punteggio));
          //stampa per punteggio
          print('punteggio');
          for (final match in matches[i]) {
            print('${match.nome}${match.punteggio}');
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
} */

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
//3
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