///Classe per la gestione dei titoli dell atleta
///
///metodi: factory per il recupero del file json
///
///

class Titoli {
  int uid;
//i titoli possono anche essere nulli perche l'atleta puo anche non averli
  String? titolo;

  Titoli({required this.uid, this.titolo});

  factory Titoli.fromJson(Map<String, dynamic> jsonMap) {
    return Titoli(
        uid: jsonMap == null ? 0 : jsonMap["uid"],
        titolo: jsonMap == null ? 'vuoto' : jsonMap["titolo"]);
  }
//aggiungi titoli
  addTitoli(List<Titoli> newTitle) {
    newTitle.add(this);
  }

  @override
  String toString() {
    return 'Titoli: $titolo';
  }
}
