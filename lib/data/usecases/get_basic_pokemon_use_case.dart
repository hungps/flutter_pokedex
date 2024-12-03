import 'package:injectable/injectable.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';

@singleton
class GetBasicPokemonsUseCase extends UseCase<List<BasicPokemon>, Pagination> {
  final PokemonRepository _pokemonRepository;

  const GetBasicPokemonsUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<List<BasicPokemon>> call(Pagination params) {
    return _pokemonRepository.getBasicPokemons(params);
  }
}
