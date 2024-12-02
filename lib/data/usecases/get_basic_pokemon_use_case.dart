import 'package:injectable/injectable.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';

class GetBasicPokemonsParams {
  const GetBasicPokemonsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}

@singleton
class GetBasicPokemonsUseCase
    extends UseCase<List<BasicPokemon>, GetBasicPokemonsParams> {
  final PokemonRepository _pokemonRepository;

  const GetBasicPokemonsUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<List<BasicPokemon>> call(GetBasicPokemonsParams params) {
    return _pokemonRepository.getBasicPokemons(
        page: params.page, limit: params.limit);
  }
}
