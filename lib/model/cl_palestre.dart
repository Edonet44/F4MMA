///Classe per la gestione delle palestre con l'utilizzo dell interfaccia Iterable

class Palestra {
  final String nome;
  final String luogo;
  final double costo;
  final String img;

  Palestra(this.nome, this.luogo, this.costo, this.img);
}

class PalestraIterable extends Iterable<Palestra> {
  final List<Palestra> _palestre = [
    Palestra("Warrior Fitness", 'Las Vegas', 10, ""),
    Palestra("Viking Soul", 'Chicago', 15, ""),
    Palestra("Olimpic Dragon", 'Los Angeles', 20, ""),
    Palestra("Bull Toxic", 'Detroit', 20, ""),
    Palestra("Black Diamond", 'Miami', 15, ""),
    Palestra("Five Stars", 'New York', 20, ""),
  ];

  @override
  Iterator<Palestra> get iterator => _palestre.iterator;
}
