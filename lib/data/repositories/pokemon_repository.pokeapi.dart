import 'package:injectable/injectable.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/entities/pokemon_properties.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/pokeapi/models/pagination.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_datasource.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_mapper.dart';
import 'package:pokedex/utils/extensions/string.dart';

@Singleton(as: PokemonRepository)
class PokeApiPokemonRepository extends PokemonRepository {
  final GithubDataSource _githubDataSource;
  final PokeApiDataSource _pokeApiDataSource;
  final PokeApiMapper _pokeApiMapper;

  const PokeApiPokemonRepository({
    required GithubDataSource githubDataSource,
    required PokeApiDataSource pokeApiDataSource,
    required PokeApiMapper pokeApiMapper,
  })  : _githubDataSource = githubDataSource,
        _pokeApiDataSource = pokeApiDataSource,
        _pokeApiMapper = pokeApiMapper;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    final resourceList = await _pokeApiDataSource.getPokemons(
      PokeApiPagination(
        limit: 20,
        offset: 0,
      ),
    );

    final pokemons = await resourceList.results
        .map((resource) => getPokemon(resource.name))
        .wait;

    return pokemons;
  }

  @override
  Future<List<Pokemon>> getPokemons({
    required int limit,
    required int page,
  }) async {
    final resourceList = await _pokeApiDataSource.getPokemons(
      PokeApiPagination(
        limit: limit,
        offset: (page - 1) * limit,
      ),
    );

    final pokemons = await resourceList.results
        .map((resource) => getPokemon(resource.name))
        .wait;

    return pokemons;
  }

  @override
  Future<List<BasicPokemon>> getBasicPokemons(Pagination pagination) async {
    final resourceList = await _pokeApiDataSource.getPokemons(
      _pokeApiMapper.pagination.fromPagination(pagination),
    );

    final pokemons = await resourceList.results
        .map((resource) => getBasicPokemon(resource.name))
        .wait;

    return pokemons;
  }

  Future<BasicPokemon> getBasicPokemon(String id) async {
    final pokemonModel = await _pokeApiDataSource.getPokemon(id);
    final pokemonSpeciesModel = await _pokeApiDataSource.getPokemonSpecies(id);

    final pokemon = _pokeApiMapper.pokemon
        .toBasicPokemon(pokemonModel, pokemonSpeciesModel);

    return pokemon;
  }

  @override
  Future<Pokemon> getPokemon(String id) async {
    final pokemon = await _pokeApiDataSource.getPokemon(id);
    final pokemonSpecies = await _pokeApiDataSource.getPokemonSpecies(id);

    return _pokeApiMapper.pokemon.toPokemon(pokemon, pokemonSpecies);
  }
}
