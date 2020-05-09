import '../../core/usecase.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../entities/pokemon.dart';

class GetPokemonsParams {
  final int page;
  final int limit;

  const GetPokemonsParams({this.page, this.limit});
}

class GetPokemonsUseCase extends UseCase<List<Pokemon>, GetPokemonsParams> {
  final PokemonRepository repository;

  const GetPokemonsUseCase(this.repository);

  @override
  Future<List<Pokemon>> call(GetPokemonsParams params) {
    return repository.getPokemons(page: params.page, limit: params.limit);
  }
}

class GetPokemonParam {
  final String number;

  const GetPokemonParam(this.number);
}

class GetPokemonUseCase extends UseCase<Pokemon, GetPokemonParam> {
  final PokemonRepository repository;

  const GetPokemonUseCase(this.repository);

  @override
  Future<Pokemon> call(GetPokemonParam params) {
    return repository.getPokemon(params.number);
  }
}
