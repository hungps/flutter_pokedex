import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex/data/source/github/network.dart';
import 'package:pokedex/data/source/github/models/item.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

@singleton
class GithubDataSource {
  static const String itemsURL =
      'https://gist.githubusercontent.com/hungps/48f4355fb1a89ddaf47f56961dc8a245/raw/pokemon-items.json';

  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  final NetworkManager _networkManager;

  const GithubDataSource({
    required NetworkManager networkManager,
  }) : _networkManager = networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await _networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }

  Future<List<GithubItemModel>> getItems() async {
    final response = await _networkManager.request(RequestMethod.get, itemsURL);

    final data =
        (json.decode(response.data) as List).map((item) => GithubItemModel.fromJson(item)).toList();

    return data;
  }
}
