import 'dart:convert';

//ricordarsi che per avere una lista nell'api bisogna certamente racchiudere tutte i valori dentro le parentesi quadre
//se il file json viene modificato anche questo file andra modificato e ricopiato nuovamente da quicktype.io
//in futuro verranno inseriti anche altri giocatori per un numero massimo di 20. quindi il file verra cambiato e ricopiato
//vedere questo tutorial REST API with Flutter  https://www.youtube.com/watch?v=c09XiwOZKsI

List<Player> playerFromJson(String str) =>
    List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
  Player({
    required this.giocatore1,
    required this.giocatore2,
    required this.giocatore3,
    required this.giocatore4,
    required this.giocatore5,
  });

  Giocatore giocatore1;
  Giocatore giocatore2;
  Giocatore giocatore3;
  Giocatore giocatore4;
  Giocatore giocatore5;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        giocatore1: Giocatore.fromJson(json["Giocatore1"]),
        giocatore2: Giocatore.fromJson(json["Giocatore2"]),
        giocatore3: Giocatore.fromJson(json["Giocatore3"]),
        giocatore4: Giocatore.fromJson(json["Giocatore4"]),
        giocatore5: Giocatore.fromJson(json["Giocatore5"]),
      );

  Map<String, dynamic> toJson() => {
        "Giocatore1": giocatore1.toJson(),
        "Giocatore2": giocatore2.toJson(),
        "Giocatore3": giocatore3.toJson(),
        "Giocatore4": giocatore4.toJson(),
        "Giocatore5": giocatore5.toJson(),
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
