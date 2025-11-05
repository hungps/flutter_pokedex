import 'package:injectable/injectable.dart';
import 'package:pokedex/data/source/github/network.dart';
import 'package:pokedex/data/source/pokeapi/models/evolution_chain.dart';
import 'package:pokedex/data/source/pokeapi/models/item.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_species.dart';
import 'package:pokedex/data/source/pokeapi/models/type.dart';

@singleton
class PokeApiDataSource {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  final NetworkManager _networkManager;

  const PokeApiDataSource({
    required NetworkManager networkManager,
  }) : _networkManager = networkManager;

  Future<PokeApiPokemonModel> getPokemon(int id) async {
    final response =
        await _networkManager.request(RequestMethod.get, '$baseUrl/pokemon/$id');

    return PokeApiPokemonModel.fromJson(response.data);
  }

  Future<PokeApiPokemonSpeciesModel> getPokemonSpecies(int id) async {
    final response =
        await _networkManager.request(RequestMethod.get, '$baseUrl/pokemon-species/$id');

    return PokeApiPokemonSpeciesModel.fromJson(response.data);
  }

  Future<PokeApiEvolutionChainModel> getEvolutionChain(int id) async {
    final response =
        await _networkManager.request(RequestMethod.get, '$baseUrl/evolution-chain/$id');

    return PokeApiEvolutionChainModel.fromJson(response.data);
  }

  Future<PokeApiTypeModel> getType(String name) async {
    final response =
        await _networkManager.request(RequestMethod.get, '$baseUrl/type/$name');

    return PokeApiTypeModel.fromJson(response.data);
  }

  Future<PokeApiItemModel> getItem(int id) async {
    final response = await _networkManager.request(RequestMethod.get, '$baseUrl/item/$id');

    return PokeApiItemModel.fromJson(response.data);
  }
}
