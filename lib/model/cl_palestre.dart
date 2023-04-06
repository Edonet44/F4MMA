///Classe per la gestione delle palestre con l'utilizzo dell interfaccia Iterable

class Palestra {
  final String? nome;
  final String? luogo;
  final double? costo;
  final String? img;

  Palestra([this.nome, this.luogo, this.costo, this.img]);
}

class PalestraIterable extends Iterable<Palestra> {
  final List<Palestra> _palestre = [
    Palestra("American Top Team (ATT)", 'Florida', 30,
        "assets/images/palestre/att-logo.png"),
    Palestra("American Kickboxing Academy (AKA)", 'California', 25,
        "assets/images/palestre/AKA_Logo.png"),
    Palestra(
        "Sanford MMA", 'Florida', 20, "assets/images/palestre/sanford-mma.png"),
    Palestra(
        "Jackson-Wink MMA", 'New Mexico', 20, "assets/images/palestre/jw.png"),
    Palestra("Kings MMA", 'California', 15,
        "assets/images/palestre/Kings_MMA_Logo.png"),
    Palestra("MMA Lab", 'Phoenix', 15, "assets/images/palestre/mmalab.png"),
  ];

  @override
  Iterator<Palestra> get iterator => _palestre.iterator;

//deve essere implementato per poter prendere la lunghezza della lista
  @override
  int get length => _palestre.length;

  Iterable<Palestra> Find_palestra(int prezzo) {
    return _palestre.where((palestra) => palestra.costo! < 10);
  }
}
