import 'dart:convert';

//ricordarsi che per avere una lista nell'api bisogna certamente racchiudere tutte i valori dentro le parentesi quadre
//se il file json viene modificato anche questo file andra modificato e ricopiato nuovamente da quicktype.io
//in futuro verranno inseriti anche altri giocatori per un numero massimo di 20. quindi il file verra cambiato e ricopiato
//vedere questo tutorial REST API with Flutter  https://www.youtube.com/watch?v=c09XiwOZKsI

List<Player> playerFromJson(String str) =>
    List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//vecchia classe funzionante per solo recupero Api
class Player {
  Player({
    required this.giocatore1,
    required this.giocatore2,
    required this.giocatore3,
    required this.giocatore4,
    required this.giocatore5,
    required this.giocatore6,
    required this.giocatore7,
    required this.giocatore8,
    required this.giocatore9,
    required this.giocatore10,
  });

  Giocatore giocatore1;
  Giocatore giocatore2;
  Giocatore giocatore3;
  Giocatore giocatore4;
  Giocatore giocatore5;
  Giocatore giocatore6;
  Giocatore giocatore7;
  Giocatore giocatore8;
  Giocatore giocatore9;
  Giocatore giocatore10;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        giocatore1: Giocatore.fromJson(json["Giocatore1"]),
        giocatore2: Giocatore.fromJson(json["Giocatore2"]),
        giocatore3: Giocatore.fromJson(json["Giocatore3"]),
        giocatore4: Giocatore.fromJson(json["Giocatore4"]),
        giocatore5: Giocatore.fromJson(json["Giocatore5"]),
        giocatore6: Giocatore.fromJson(json["Giocatore6"]),
        giocatore7: Giocatore.fromJson(json["Giocatore7"]),
        giocatore8: Giocatore.fromJson(json["Giocatore8"]),
        giocatore9: Giocatore.fromJson(json["Giocatore9"]),
        giocatore10: Giocatore.fromJson(json["Giocatore10"]),
      );

  Map<String, dynamic> toJson() => {
        "Giocatore1": giocatore1.toJson(),
        "Giocatore2": giocatore2.toJson(),
        "Giocatore3": giocatore3.toJson(),
        "Giocatore4": giocatore4.toJson(),
        "Giocatore5": giocatore5.toJson(),
        "Giocatore6": giocatore6.toJson(),
        "Giocatore7": giocatore7.toJson(),
        "Giocatore8": giocatore8.toJson(),
        "Giocatore9": giocatore9.toJson(),
        "Giocatore10": giocatore10.toJson(),
      };
}

class Giocatore {
  Giocatore({
    required this.uid,
    required this.nome,
    required this.titoli,
    required this.hype,
    required this.forza,
    required this.destrezza,
    required this.stamina,
    required this.striking,
    required this.groundgame,
    required this.salute,
    required this.money,
    required this.punteggio,
    required this.criticalStrike,
    required this.immagine,
    required this.data,
  });

  int uid;
  String nome;
  List<String> titoli;
  List<int> hype;
  int forza;
  int destrezza;
  int stamina;
  int striking;
  int groundgame;
  int salute;
  int money;
  int punteggio;
  int criticalStrike;
  String immagine;
  String data;

  factory Giocatore.fromJson(Map<String, dynamic> json) => Giocatore(
        uid: json["uid"] ?? 0,
        nome: json["nome"] ?? "vuoto",
        titoli: List<String>.from(json["titoli"].map((x) => x)),
        hype: List<int>.from(json["hype"].map((x) => x)),
        forza: json["forza"] ?? 0,
        destrezza: json["destrezza"] ?? 0,
        stamina: json["stamina"] ?? 0,
        striking: json["striking"] ?? 0,
        groundgame: json["groundgame"] ?? 0,
        salute: json["salute"],
        money: json["money"] ?? 0,
        punteggio: json["punteggio"] ?? 0,
        criticalStrike: json["criticalStrike"] ?? 0,
        immagine: json["immagine"] ?? "vuoto",
        data: json["data"] ?? "vuoto",
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "nome": nome,
        "titoli": List<dynamic>.from(titoli.map((x) => x)),
        "hype": List<dynamic>.from(hype.map((x) => x)),
        "forza": forza,
        "destrezza": destrezza,
        "stamina": stamina,
        "striking": striking,
        "groundgame": groundgame,
        "salute": salute,
        "money": money,
        "punteggio": punteggio,
        "criticalStrike": criticalStrike,
        "immagine": immagine,
        "data": data,
      };
}

//new classe api di tipo iterabile
// class Player {
//   Player({
//     required this.giocatore1,
//     required this.giocatore2,
//     required this.giocatore3,
//     required this.giocatore4,
//     required this.giocatore5,
//   });

//   Giocatore giocatore1;
//   Giocatore giocatore2;
//   Giocatore giocatore3;
//   Giocatore giocatore4;
//   Giocatore giocatore5;

//   factory Player.fromJson(Map<String, dynamic> json) => Player(
//         giocatore1: Giocatore.fromJson(json["Giocatore1"]),
//         giocatore2: Giocatore.fromJson(json["Giocatore2"]),
//         giocatore3: Giocatore.fromJson(json["Giocatore3"]),
//         giocatore4: Giocatore.fromJson(json["Giocatore4"]),
//         giocatore5: Giocatore.fromJson(json["Giocatore5"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Giocatore1": giocatore1.toJson(),
//         "Giocatore2": giocatore2.toJson(),
//         "Giocatore3": giocatore3.toJson(),
//         "Giocatore4": giocatore4.toJson(),
//         "Giocatore5": giocatore5.toJson(),
//       };
// }

// class Giocatore extends Iterable<int> {
//   Giocatore({
//     required this.uid,
//     required this.nome,
//     required this.titoli,
//     required this.hype,
//     required this.forza,
//     required this.destrezza,
//     required this.stamina,
//     required this.striking,
//     required this.groundgame,
//     required this.salute,
//     required this.money,
//     required this.punteggio,
//     required this.criticalStrike,
//     required this.immagine,
//     required this.data,
//   });

//   int uid;
//   String nome;
//   List<String> titoli;
//   List<int> hype;
//   int forza;
//   int destrezza;
//   int stamina;
//   int striking;
//   int groundgame;
//   int salute;
//   int money;
//   int punteggio;
//   int criticalStrike;
//   String immagine;
//   String data;

//   //late Iterable<dynamic> _iterable;

//   @override
//   Iterator<int> get iterator => GiocatoreIterator(this);

//   factory Giocatore.fromJson(Map<String, dynamic> json) => Giocatore(
//         uid: json["uid"] ?? 0,
//         nome: json["nome"] ?? "vuoto",
//         titoli: List<String>.from(json["titoli"].map((x) => x)),
//         hype: List<int>.from(json["hype"].map((x) => x)),
//         forza: json["forza"] ?? 0,
//         destrezza: json["destrezza"] ?? 0,
//         stamina: json["stamina"] ?? 0,
//         striking: json["striking"] ?? 0,
//         groundgame: json["groundgame"] ?? 0,
//         salute: json["salute"],
//         money: json["money"] ?? 0,
//         punteggio: json["punteggio"] ?? 0,
//         criticalStrike: json["criticalStrike"] ?? 0,
//         immagine: json["immagine"] ?? "vuoto",
//         data: json["data"] ?? "vuoto",
//       );

//   Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "nome": nome,
//         "titoli": List<dynamic>.from(titoli.map((x) => x)),
//         "hype": List<dynamic>.from(hype.map((x) => x)),
//         "forza": forza,
//         "destrezza": destrezza,
//         "stamina": stamina,
//         "striking": striking,
//         "groundgame": groundgame,
//         "salute": salute,
//         "money": money,
//         "punteggio": punteggio,
//         "criticalStrike": criticalStrike,
//         "immagine": immagine,
//         "data": data,
//       };

//   //nb se non voglio piu implementare altri metodi basta utilizzare il metodo
//   //nosuchmethod nella classe dove creo l implementazione
// //cerca un valore nella classe
//   int elementAt(int index) {
//     if (index < 0 || index >= length) {
//       throw RangeError.range(index, 0, length - 1, 'index');
//     }
//     switch (index) {
//       case 0:
//         return forza;
//       case 1:
//         return destrezza;
//       case 2:
//         return stamina;
//       case 3:
//         return striking;
//       case 4:
//         return groundgame;
//       case 5:
//         return salute;
//       case 6:
//         return money;
//       case 7:
//         return punteggio;
//       case 8:
//         return criticalStrike;
//       default:
//         throw StateError('Invalid index $index');
//     }
//   }

//   @override
//   bool any(bool Function(int element) test) {
//     return toList().any(test);
//   }

//   @override
//   Iterable<R> cast<R>() => map((e) => e as R);

//   @override
//   bool contains(Object? element) {
//     if (element is int) {
//       return toList().contains(element);
//     }
//     return false;
//   }

// //funzione che restituisce un valore se tutti gli interi sono realmente positivi
//   bool every(bool Function(int element) test) {
//     for (int value in this) {
//       if (!test(value)) {
//         return false;
//       }
//     }
//     return true;
//   }



// class GiocatoreIterator extends Iterator<int> {
//   final Giocatore _giocatore;
//   int _currentIndex = 0;

//   GiocatoreIterator(this._giocatore);

//   @override
//   int get current => _currentIndex;

//   @override
//   bool moveNext() {
//     if (_currentIndex < 14) {
//       _currentIndex++;
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
