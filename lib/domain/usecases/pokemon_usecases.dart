import '../../core/usecase.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../entities/pokemon.dart';

class GetAllPokemonsUseCase extends NoParamsUseCase<List<Pokemon>> {
  const GetAllPokemonsUseCase(this.repository);

  final PokemonRepository repository;

  @override
  Future<List<Pokemon>> call() {
    return repository.getAllPokemons();
  }
}

class GetPokemonsParams {
  const GetPokemonsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}

class GetPokemonsUseCase extends UseCase<List<Pokemon>, GetPokemonsParams> {
  const GetPokemonsUseCase(this.repository);

  final PokemonRepository repository;

  @override
  Future<List<Pokemon>> call(GetPokemonsParams params) {
    return repository.getPokemons(page: params.page, limit: params.limit);
  }
}

class GetPokemonParam {
  final String number;

  const GetPokemonParam(this.number);
}

class GetPokemonUseCase extends UseCase<Pokemon?, GetPokemonParam> {
  final PokemonRepository repository;

  const GetPokemonUseCase(this.repository);

  @override
  Future<Pokemon?> call(GetPokemonParam params) {
    return repository.getPokemon(params.number);
  }
}
