import 'package:injectable/injectable.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_datasource.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_mapper.dart';

@Singleton(as: PokemonRepository)
class PokeApiPokemonRepository extends PokemonRepository {
  final PokeApiDataSource _pokeApiDataSource;
  final PokeApiMapper _pokeApiMapper;

  const PokeApiPokemonRepository({
    required PokeApiDataSource pokeApiDataSource,
    required PokeApiMapper pokeApiMapper,
  })  : _pokeApiDataSource = pokeApiDataSource,
        _pokeApiMapper = pokeApiMapper;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    return [];
  }

  @override
  Future<List<Pokemon>> getPokemons({
    required int limit,
    required int page,
  }) async {
    return [];
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
  Future<Pokemon?> getPokemon(String number) async {
    return null;
  }
}
