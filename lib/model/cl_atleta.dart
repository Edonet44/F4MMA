import 'package:f4mma/model/cl_titoli.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'cl_fan.dart';
import 'dart:convert';

class Atleti {
  int _uid;
  String _nome;

  Atleti(
    this._uid,
    this._nome,
  );

  int get uid => _uid;
  set uid(int name) => _uid = uid;

  String get nome => _nome;
  set name(String name) => _nome = name;

//recupero dati json
  factory Atleti.fromJson(Map<String, dynamic> json) {
    return Atleti(
      json['uid'],
      json["nome"],
    );
  }
//crea atleta
  void createPerson(List<Atleti> atleti) {
    atleti.add(this);
  }

//ricerca per chiave e aggiornamento
  void updatePerson(List<Atleti> atleti, Atleti updatedPerson) {
    var index = atleti.indexWhere((atleta) => atleta._nome == this._nome);
    if (index != -1) {
      atleti[index] = updatedPerson;
    }
  }

//eliminazione atleta
  void deletePerson(List<Atleti> atleti) {
    atleti.removeWhere((atleta) => atleta.nome == this._nome);
  }

/* //metodo utile se voglio cambiare un valore interno alla classe senza utilizzare nuovamente un costruttore
  Atleti copywith({String nome,String titoli,int hype,Int forza, int destrezza, int stamina, int striking, int groundgame,int criticalstrike,Image immagine, DateTime data});
 */

//metodo che ritorna il valore stringa dell oggetto
  @override
  String toString() => 'uid:$uid'
      'Nome: $nome';

//confronto tra puntatori di memoria
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Atleti &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          nome == other.nome;

// hashCode viene utilizzato per la creazione delle Map{}
  @override
  int get hashCode => uid.hashCode ^ nome.hashCode;

//ritorna un intero e si utilizza il parsing per convertire da stringa a integer
  /*  int TotValori()=> int.parse(pagine); */

  /*  ///Stampa la data dell'atleta
  String StampaData() => ''; 
  
  */
  //per scrivere nel json
  Map<String, dynamic> toJson() => {'uid': uid, 'nome': nome};
}

class AtletiManager extends Atleti {
  final List<Titoli> titoli;
  final List<FriendsFan> friends;
  final int forza;
  final int destrezza;
  final int stamina;
  final int striking;
  final int groundgame;
  final int criticalstrike;
  final String data;
  final String immagine;
  List<Atleti> atletiList = [];

  AtletiManager(
    int uid,
    String nome,
    this.titoli,
    this.friends,
    this.forza,
    this.destrezza,
    this.stamina,
    this.striking,
    this.groundgame,
    this.criticalstrike,
    this.data,
    this.immagine,
  ) : super(uid, nome);

//aggiunge un atleta
  void addAtleta(List<Atleti> newUser) {
    atletiList.add(this);
  }

//funzione per il recupero di un utente nella lista tramite l indice di tipo facoltativo
  // se ateleta non prensente in elenco ritorna l'indice assegnato
  Atleti? atletiManager({required int Indice}) {
    return atletiList.length > Indice ? atletiList[Indice] : null;
  }

//aggiornamento atleta
  void updateAtleta(int index, Atleti updatedUser) {
    atletiList[index] = updatedUser;
  }

//delete atleta
  void deleteAtleta(int index) {
    atletiList.removeAt(index);
  }

  void stampaAtleta() {
    print(
        'Titoli: $titoli, Hype: $friends,Forza:$forza,Destrezza:$destrezza,Stamina:$stamina,Immagine:$immagine Data: $data');
  }

//get atleta fromJson
  factory AtletiManager.fromJson(String jsonString) {
    try {
      //associa alla variabile dinamica il decode della stringa passata
      final jsonMap = json.decode(jsonString);
      // creo una lista con valore nullo della classe friendsfan
      final List<FriendsFan> friends = [];
      final List<Titoli> titoli = [];

      //se hype e' diverso da nullo
      if (jsonMap['hype'] != null) {
        for (final hype in jsonMap['hype']) {
          //aggiunge alla variabile di tipo Friendsfan il risultato dei valori di hype
          final FriendsFan friendsFan = FriendsFan.fromJson(hype);
          //adesso si puo aggiungere all array i valori e popolare la lista Friends
          friends.add(friendsFan);
        }
      }
      //si ripete la stessa cosa per la lista titoli
      if (jsonMap['titoli'] != null) {
        for (final titoli in jsonMap['titoli']) {
          final Titoli titles = Titoli.fromJson(titoli);
          titoli.add(titles);
        }
      }
      //capire come gestire i valori nulli senza il required
      return AtletiManager(
          jsonMap["uid"],
          jsonMap["nome"],
          titoli,
          friends,
          jsonMap["forza"],
          jsonMap["destrezza"],
          jsonMap["stamina"],
          jsonMap["striking"],
          jsonMap["groundgame"],
          jsonMap["criticalstrike"],
          jsonMap["data"],
          jsonMap["immagine"]

          //json con required nelle variabili
          // forza: json == null ? 0 : jsonMap["forza"],
          );
    } on FormatException {
      throw Exception("C'e un errore nella codifica del file Json");
    } catch (e) {
      throw Exception("Errore generico $e");
    }
  }

  //
  //Crea atleta per convertire Atleta toJson
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nome': nome,
        'Titoli': titoli,
        'Hype': friends,
        'Forza': forza,
        'Destrezza': destrezza,
        'Stamina': stamina,
        'Striking': striking,
        'GroundGame': groundgame,
        'CriticalStrike': criticalstrike,
        'Immagine': immagine,
        'Data': data
      };

  @override
  String toString() {
    return 'Titoli: $titoli, Hype: $friends,Forza:$forza,Destrezza:$destrezza,Stamina:$stamina,Immagine:$immagine Data: $data';
  }
}

void main() {
//Test creazione atleta
  var atleti = <AtletiManager>[];
  var titoli = <Titoli>[];
  var fans = <FriendsFan>[];

  //istanza della classe Titoli
  var titolo = Titoli(uid: 10, titolo: 'Ufc 7 posto');
  //aggiungo titoli
  titolo.addTitoli(titoli);

//istanza e creazione di un hype fittizio di 10 punti
  var fan = FriendsFan(uid: 10, nome: 'Il Pirata di Ossa');
  //aggiungo fan
  fan.addFan(fans);

  AtletiManager atleta1 = AtletiManager(
      1, 'Jonny', titoli, fans, 20, 20, 20, 20, 15, 10, '22/04/23', '');
//aggiungo atleta
  atleta1.addAtleta(atleti);
  print(atleta1._uid);
  print(atleta1.nome);
  print(atleta1); // stampa la lista aggiornata

  ///test per serializzazione json
  var jsonPerson = '{"name": "Giovanni Verdi", "age": 42}';
  var decodedPerson = jsonDecode(jsonPerson);
  var personFromJson = AtletiManager.fromJson(decodedPerson);
  print(personFromJson.toJson());

// Test json
// String jsonStr = '{"name": "Alice", "age": null, "addresses": [{"street": "123 Main St", "city": null}, {"street": "456 Elm St", "city": "Boston"}]}';

//   try {
//     var person = Person.fromJson(jsonStr);
//     print(person.name);
//     print(person.age);
//     for (final address in person.addresses) {
//       print(address.street);
//       print(address.city);
//     }
//   } on Exception catch (e) {
//     print('Errore: $e');
//   }
}