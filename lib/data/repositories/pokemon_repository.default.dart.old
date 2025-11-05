import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/github_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/data/entities/pokemon.dart';

@Singleton(as: PokemonRepository)
class PokemonDefaultRepository extends PokemonRepository {
  final GithubDataSource _githubDataSource;
  final LocalDataSource _localDataSource;

  const PokemonDefaultRepository({
    required GithubDataSource githubDataSource,
    required LocalDataSource localDataSource,
  })  : _githubDataSource = githubDataSource,
        _localDataSource = localDataSource;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    final hasCachedData = await _localDataSource.hasData();

    if (!hasCachedData) {
      final pokemonGithubModels = await _githubDataSource.getPokemons();
      final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());

      await _localDataSource.savePokemons(pokemonHiveModels);
    }

    final pokemonHiveModels = await _localDataSource.getAllPokemons();

    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }

  @override
  Future<List<Pokemon>> getPokemons({required int limit, required int page}) async {
    final hasCachedData = await _localDataSource.hasData();

    if (!hasCachedData) {
      final pokemonGithubModels = await _githubDataSource.getPokemons();
      final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());

      await _localDataSource.savePokemons(pokemonHiveModels);
    }

    final pokemonHiveModels = await _localDataSource.getPokemons(
      page: page,
      limit: limit,
    );
    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }

  @override
  Future<Pokemon?> getPokemon(String number) async {
    final pokemonModel = await _localDataSource.getPokemon(number);

    if (pokemonModel == null) return null;

    // get all evolutions
    final evolutions = await _localDataSource.getEvolutions(pokemonModel);

    final pokemon = pokemonModel.toEntity(evolutions: evolutions);

    return pokemon;
  }
}
