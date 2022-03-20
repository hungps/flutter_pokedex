import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/item.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String itemsURL =
      'https://gist.githubusercontent.com/AmbujaAK/1a47a19039a4203252ed834ff65ed140/raw/4058b8ee4a4747ad7bdeb63b69eb40ce15e5abe3/items.json';

  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

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
