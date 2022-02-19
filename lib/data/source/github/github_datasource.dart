import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  GithubDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }
}
