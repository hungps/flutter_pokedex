import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource_list.dart';
import 'package:pokedex/data/source/pokeapi/models/pagination.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_species.dart';
import 'package:retrofit/retrofit.dart';

part 'pokeapi_datasource.g.dart';

@singleton
@RestApi(baseUrl: '/api/v2/')
abstract class PokeApiDataSource {
  @factoryMethod
  factory PokeApiDataSource(Dio dio) = _PokeApiDataSource;

  @GET('/pokemon')
  Future<PokeApiNamedApiResourceList> getPokemons(
    @Queries() PokeApiPagination pagination,
  );

  @GET('/pokemon/{name}')
  Future<PokeApiPokemon> getPokemon(
    @Path('name') String name,
  );

  @GET('/pokemon-species/{name}')
  Future<PokeApiPokemonSpecies> getPokemonSpecies(
    @Path('name') String name,
  );
}
