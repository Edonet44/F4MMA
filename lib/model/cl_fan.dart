//import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

///Classe per creare l hype dell atelta con utilizzo dell algoritmo sentimentale
///
///metodi:Factory json per recupero valori
///
///
///

abstract class Fan {
  final int uid;

  Fan({required this.uid});
}

class FriendsFan extends Fan {
  final String nome;

  FriendsFan({required int uid, required this.nome}) : super(uid: uid);

  factory FriendsFan.fromJson(Map<String, dynamic> json) {
    return FriendsFan(
      uid: json['uid'],
      nome: json['nome'],
    );
  }

//crea un fan
  addFan(List<Fan> newFan) {
    newFan.add(this);
  }

  ///Funzione genera hype che cosa ha bisogno l'hype per salire?
  ///:1 Negativo i valori di attacco aumenteranno ma a discapito di un eccitazione maggiore e quindi minore stamina
  ///:2 Neutro i valori cambiano di poco nel nostro Atleta
  ///:3 Buono  i valori crederà piu in se stesso e quindi maggiore difesa dai colpi critici

  int Calcola_hype() {
    int hype = 0;
    //funzione per il calcolo dell'hype basata sul Sentiment algorithm
    return 0;
  }

  @override
  String toString() {
    return 'Nome: $nome';
  }
}

void main() {
  // Creiamo un'istanza del sentiment analyzer
  //final sentiment = Sentiment.analysis(text);

  // Esempio di frasi da analizzare
  final phrases = [
    'Adoro questa canzone!',
    'Jhon b Bon e una 💩',
    'Non sono sicuro di come mi sento riguardo a questo film',
    'Questa esperienza è stata fantastica',
    'Non mi è piaciuto affatto il servizio',
  ];

  // Analizziamo le frasi una per una
  for (final phrase in phrases) {
    // Otteniamo il punteggio di sentiment per la frase
    final score = Sentiment.analysis(phrase, emoji: true);

    // Stampiamo il punteggio e la frase
    print('Frase: $phrase');
    print('Punteggio di sentiment: $score\n');
  }
}
