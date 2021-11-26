import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/item.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  static const String url =
      'https://gist.githubusercontent.com/scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';
  static const String itemsURL =
      'https://gist.githubusercontent.com/scitbiz/69bb2082702ecbdf3d26cd7ba2a2e00d/raw/pokemon_items.json';
  GithubDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }

  Future<List<GithubItemModel>> getItems() async {
    final response = await networkManager.request(RequestMethod.get, itemsURL);

    final data =
        (json.decode(response.data) as List).map((item) => GithubItemModel.fromJson(item)).toList();

    return data;
  }
}
