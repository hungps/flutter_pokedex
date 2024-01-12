abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonLoadStarted extends PokemonEvent {
  final bool loadAll;

  const PokemonLoadStarted({this.loadAll = false});
}

class PokemonLoadMoreStarted extends PokemonEvent {}

class PokemonSelectChanged extends PokemonEvent {
  final String pokemonId;

  const PokemonSelectChanged({required this.pokemonId});
}
