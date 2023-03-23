///Classe per la gestione delle palestre con l'utilizzo dell interfaccia Iterable

class Palestra {
  final String nome;
  final String luogo;
  final int costo;
  final String img;

  Palestra(this.nome, this.luogo, this.costo, this.img);
}

class PalestraIterable extends Iterable<Palestra> {
  final List<Palestra> _palestre = [
    Palestra("Warrior Fitness", 'Las Vegas', 100, ""),
    Palestra("Viking Soul", 'Chicago', 150, ""),
    Palestra("Olimpic Dragon", 'Los Angeles', 200, ""),
    Palestra("Bull Toxic", 'Detroit', 200, ""),
    Palestra("Black Diamond", 'Miami', 150, ""),
    Palestra("Five Stars", 'New York', 200, ""),
  ];

  @override
  Iterator<Palestra> get iterator => _palestre.iterator;
}
