import 'dart:convert';
import 'dart:math';
import 'dart:async' show Future;
import 'package:f4mma/model/cl_titoli.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:f4mma/model/cl_atleta.dart';

import 'cl_api_player.dart';

///Classe per la creazione dei Match
///utlizzo dell'algoritmo Swiss system turnament
///utilizzo dell algoritmo di confronto a curva di probabilità

class Incontri {
  /// 1 recupero i valori di ogni singolo giocatore dal file players_config.json
  /// 2 creare i match
  /// 3 creare il metodo di confronto  //nb mettere la classe api iterable, ripassare gli iterable

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

// 1 Iterazione sulla lista di giocatori: viene utilizzata una doppia iterazione su tutti i giocatori della lista, in modo che ogni giocatore venga confrontato con ogni altro giocatore della lista.

// 2 Calcolo della probabilità di vittoria per ogni giocatore: viene chiamata la funzione "calculateWinningChance" per calcolare la probabilità di vittoria di ciascun giocatore rispetto all'altro.

// 3 Simulazione dello scontro tra i giocatori: viene chiamata la funzione "simulateBattle" per generare una simulazione di scontro tra i due giocatori, utilizzando la probabilità di vittoria calcolata in precedenza per determinare il vincitore.

// 4 Definizione della funzione "simulateBattle": la funzione prende in input due oggetti "Giocatri" e le rispettive probabilità di vittoria, e genera un numero casuale per determinare il vincitore dello scontro. Viene quindi stampato il risultato dello scontro sulla console.

// 5 Definizione della funzione "calculateWinningChance": la funzione prende in input due oggetti "Giocatori" e calcola la probabilità di vittoria di ciascun giocatore rispetto all'altro, sulla base della somma delle loro statistiche di gioco. Viene inoltre aggiunto un po' di casualità alla probabilità di vittoria, per rendere il gioco più interessante.

// 6 Definizione della funzione "addRandomness": la funzione prende in input una probabilità e ne aumenta la casualità, restituendo una nuova probabilità con un valore casuale aggiunto. Questa funzione viene utilizzata all'interno della funzione "calculateWinningChance".

  void Creamatches(List<Giocatore>? giocatori) {
    try {
      List<Giocatore> classifica =
          []; // nuova lista per memorizzare tutti i giocatori e i loro punteggi
      // Itera su tutti i giocatori e confrontali con gli altri giocatori
      for (var i = 0; i < giocatori!.length - 1; i++) {
        print('Round ${i + 1}');
        Giocatore giocatore1 = giocatori[i];
        bool hasMatched = false; // indica se il giocatore1 ha già combattuto

        for (var j = i + 1; j < giocatori.length; j++) {
          if (hasMatched) {
            // se il giocatore1 ha già combattuto, salta i confronti successivi
            break;
          }
          Giocatore giocatore2 = giocatori[j];
          // Calcola la probabilità di vittoria per ciascun giocatore
          double player1Chance = calculateWinningChance(giocatore1, giocatore2);
          double player2Chance = 1 - player1Chance;

          //decide in modo casuale il numero di round per ogni incontro
          Random rand = Random();
          int numRounds = rand.nextDouble() < 0.5 ? 3 : 5;

          // Simula tre round per ogni incontro
          int player1Wins = 0;
          int player2Wins = 0;

          for (var k = 0; k < numRounds; k++) {
            double roundPlayer1Chance =
                calculateRoundWinningChance(player1Chance);
            double roundPlayer2Chance = 1 - roundPlayer1Chance;
            int roundWinner = simulateRound(
                giocatore1, giocatore2, roundPlayer1Chance, roundPlayer2Chance);
            if (roundWinner == 1) {
              player1Wins++;
            } else {
              player2Wins++;
            }
          }
          // Determina il vincitore dell'incontro
          // Determine the winner of the match
          if (player1Wins > player2Wins) {
            print(
                '${giocatore1.nome} ha vinto la partita contro ${giocatore2.nome} (${player1Wins}-${player2Wins})');
            giocatore1.punteggio += 3;
          } else if (player2Wins > player1Wins) {
            print(
                '${giocatore2.nome} ha vinto la partita contro ${giocatore1.nome} (${player2Wins}-${player1Wins})');
            giocatore2.punteggio += 3;
          } else {
            print(
                'La partita tra ${giocatore1.nome} e ${giocatore2.nome} è finita in pareggio (${player1Wins}-${player2Wins})');
            giocatore1.punteggio += 1;
            giocatore2.punteggio += 1;
          }
          // Aggiungi i giocatori e i loro punteggi alla nuova lista
          classifica.add(giocatore1);
          classifica.add(giocatore2);
          // Genera una simulazione di scontro tra i giocatori
          // simulateBattle(giocatore1, giocatore2, player1Chance, player2Chance);

          // Rimuove il giocatore che ha appena combattuto dalla lista dei giocatori
          hasMatched = true; // segna il giocatore1 come "già combattuto"
          giocatori.remove(giocatore2);
          j--;
        }
      }
      // Ordina i giocatori per punteggio della seconda lista
      classifica.sort((a, b) => b.punteggio.compareTo(a.punteggio));
      //chiama funzione di stampa classifica
      Stmp_classifica(classifica);
    } catch (e) {
      print(e);
    }
  }

//calcolo probabilità per punteggio a 3 o 5 round
  double calculateRoundWinningChance(double player1Chance) {
    // Aggiungi un po' di casualità per rendere il gioco più interessante
    double minRandomness = 0.05;
    double maxRandomness = 0.2;
    Random rand = Random();
    double randomness =
        minRandomness + (maxRandomness - minRandomness) * rand.nextDouble();
    double roundPlayer1Chance =
        player1Chance + (randomness * (rand.nextBool() ? 1 : -1));
    double roundPlayer2Chance = 1 - roundPlayer1Chance;
    return roundPlayer1Chance;
  }

  int simulateRound(Giocatore player1, Giocatore player2,
      double roundPlayer1Chance, double roundPlayer2Chance) {
    // Genera tre numeri casuali per determinare il vincitore di ogni round
    Random rand = Random();
    int player1Wins = 0;
    int player2Wins = 0;

    for (var i = 0; i < 3; i++) {
      double randNum = rand.nextDouble();
      if (randNum < roundPlayer1Chance) {
        player1Wins++;
      } else {
        player2Wins++;
      }
    }

    // Determina il vincitore del round
    if (player1Wins > player2Wins) {
      return 1;
    } else {
      return 2;
    }
  }

//funzione per stabilire la classifica fra giocatori
  void Stmp_classifica(List<Giocatore> classifica) {
    // Visualizza la classifica finale
    for (var i = 0; i < classifica.length; i++) {
      print(
          '${i + 1}. ${classifica[i].nome} (${classifica[i].punteggio} punti)');
    }
  }

// da gestire in un secondo momento il valore dell hype!
  double calculateWinningChance(player1, player2) {
    double p1Strength = player1.forza.toDouble() +
        player1.destrezza.toDouble() +
        player1.striking.toDouble() +
        player1.stamina.toDouble() +
        player1.groundgame.toDouble() +
        player1.salute.toDouble() +
        player1.criticalStrike.toDouble();
    double p2Strength = player2.forza.toDouble() +
        player2.destrezza.toDouble() +
        player2.striking.toDouble() +
        player2.stamina.toDouble() +
        player2.groundgame.toDouble() +
        player2.salute.toDouble() +
        player2.criticalStrike.toDouble();

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
    double randomness =
        minRandomness + (maxRandomness - minRandomness) * rand.nextDouble();
    return prob + (randomness * (rand.nextBool() ? 1 : -1));
  }

  // void simulateBattle(Giocatore player1, Giocatore player2,
  //     double player1Chance, double player2Chance) {
  //   // Genera un numero casuale per determinare il vincitore del scontro
  //   Random rand = Random();
  //   double randomNumber = rand.nextDouble();

  //   if (randomNumber < player1Chance) {
  //     print(
  //         '${player1.nome} ha sconfitto ${player2.nome} con una probabilità del ${player1Chance * 100}%!');
  //   } else {
  //     print(
  //         '${player2.nome} ha sconfitto ${player1.nome} con una probabilità del ${player2Chance * 100}%!');
  //   }
  // }
}


//classe che simula scontro
 

// class Player {
//  final String nome;
//   final int magic;
//   final int dextery;
//   final int power;

//   Player({required this.nome,required this.magic,required this.dextery,required this.power});
// }
// void main(){
  
// // Crea una lista di giocatori
//   List<Player> players = [
//     Player(nome: 'Mario', magic: 20, dextery: 50, power: 50),
//     Player(nome: 'Luigi', magic: 8, dextery: 7, power: 4),
//     Player(nome: 'Principessa Peach', magic: 9, dextery: 6, power: 6),
//     // Aggiungi altri giocatori qui
//   ];

//   // Itera su tutti i giocatori e confrontali con gli altri giocatori
//   for (int i = 0; i < players.length; i++) {
//     Player player1 = players[i];

//     for (int j = i + 1; j < players.length; j++) {
//       Player player2 = players[j];

//       // Calcola la probabilità di vittoria per ciascun giocatore
//       double player1Chance = calculateWinningChance(player1, player2);
//       double player2Chance = 1 - player1Chance;

//       // Genera una simulazione di scontro tra i giocatori
//       simulateBattle(player1, player2, player1Chance, player2Chance);
//     }
//   }
// }

// void simulateBattle(Player player1, Player player2, double player1Chance, double player2Chance) {
//   // Genera un numero casuale per determinare il vincitore del scontro
//   Random rand = Random();
//   double randomNumber = rand.nextDouble();

//   if (randomNumber < player1Chance) {
//     print('${player1.nome} ha sconfitto ${player2.nome} con una probabilità del ${player1Chance * 100}%!');
//   } else {
//     print('${player2.nome} ha sconfitto ${player1.nome} con una probabilità del ${player2Chance * 100}%!');
//   }
// }

// double calculateWinningChance(player1,player2) {
// double p1Strength = player1.magic.toDouble() + player1.dextery.toDouble() + player1.power.toDouble();
// double p2Strength = player2.magic.toDouble() + player2.dextery.toDouble() + player2.power.toDouble();

//   double p1Prob = p1Strength / (p1Strength + p2Strength);
//   double p2Prob = 1 - p1Prob;

//   // add some randomness to make the game more interesting
//   p1Prob = addRandomness(p1Prob);
//   p2Prob = 1 - p1Prob;

//   return p1Prob;
// }
// double addRandomness(double prob) {
//    Random rand = Random();
//    double minRandomness = 0.05;
//   double maxRandomness = 0.2;
//   double randomness =
//       minRandomness + (maxRandomness - minRandomness) * rand.nextDouble();
//   return prob + (randomness * (rand.nextBool() ? 1 : -1));
//  }







