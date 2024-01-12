import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  const PokemonRepository();

  Future<List<Pokemon>> getAllPokemons();

  Future<List<Pokemon>> getPokemons({required int limit, required int page});

  Future<Pokemon?> getPokemon(String number);
}
