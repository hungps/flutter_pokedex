import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/entities/pokemon.dart';

abstract class PokemonRepository {
  const PokemonRepository();

  Future<List<Pokemon>> getAllPokemons();

  Future<List<Pokemon>> getPokemons({
    required int limit,
    required int page,
  });

  Future<List<BasicPokemon>> getBasicPokemons(Pagination pagination);

  Future<Pokemon?> getPokemon(String number);
}
