class PokemonGender {
  final bool genderless;
  final double male;
  final double female;

  PokemonGender({
    this.genderless,
    this.male,
    this.female,
  });
}

class PokemonStats {
  const PokemonStats({
    this.attack,
    this.specialAttack,
    this.defense,
    this.specialDefense,
    this.hp,
    this.speed,
  });

  final int attack;
  final int specialAttack;
  final int defense;
  final int specialDefense;
  final int hp;
  final int speed;
}
