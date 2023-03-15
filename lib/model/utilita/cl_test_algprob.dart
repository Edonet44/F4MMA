import 'dart:math';

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
  double randomness =
      minRandomness + (maxRandomness - minRandomness) * rand.nextDouble();
  return prob + (randomness * (rand.nextBool() ? 1 : -1));
}
