class PokemonGender {
  final bool genderless;
  final double male;
  final double female;

  PokemonGender({
    required this.genderless,
    required this.male,
    required this.female,
  });
}

class PokemonStats {
  const PokemonStats({
    required this.attack,
    required this.specialAttack,
    required this.defense,
    required this.specialDefense,
    required this.hp,
    required this.speed,
  });

  final int attack;
  final int specialAttack;
  final int defense;
  final int specialDefense;
  final int hp;
  final int speed;

  int get total => attack + specialAttack + defense + specialDefense + hp + speed;
}
