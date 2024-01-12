import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/source/local/models/item.dart';
import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_gender.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';

@singleton
class LocalDataSource {
  const LocalDataSource();

  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<PokemonHiveModel>(PokemonHiveModelAdapter());
    Hive.registerAdapter<PokemonGenderHiveModel>(PokemonGenderHiveModelAdapter());
    Hive.registerAdapter<PokemonStatsHiveModel>(PokemonStatsHiveModelAdapter());
    Hive.registerAdapter<ItemHiveModel>(ItemHiveModelAdapter());

    await Hive.openBox<PokemonHiveModel>(PokemonHiveModel.boxKey);
    await Hive.openBox<PokemonGenderHiveModel>(PokemonGenderHiveModel.boxKey);
    await Hive.openBox<PokemonStatsHiveModel>(PokemonStatsHiveModel.boxKey);
    await Hive.openBox<ItemHiveModel>(ItemHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    return pokemonBox.length > 0;
  }

  Future<bool> hasItemData() async {
    final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);

    return itemBox.length > 0;
  }

  Future<void> savePokemons(Iterable<PokemonHiveModel> pokemons) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemonsMap = {for (var e in pokemons) e.number: e};

    await pokemonBox.clear();
    await pokemonBox.putAll(pokemonsMap);
  }

  Future<List<PokemonHiveModel>> getAllPokemons() async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemons = List.generate(pokemonBox.length, (index) => pokemonBox.getAt(index))
        .whereType<PokemonHiveModel>()
        .toList();

    return pokemons;
  }

  Future<List<PokemonHiveModel>> getPokemons({required int page, required int limit}) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);
    final totalPokemons = pokemonBox.length;

    final start = (page - 1) * limit;
    final newPokemonCount = min(totalPokemons - start, limit);

    final pokemons = List.generate(newPokemonCount, (index) => pokemonBox.getAt(start + index))
        .whereType<PokemonHiveModel>()
        .toList();

    return pokemons;
  }

  Future<PokemonHiveModel?> getPokemon(String number) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    return pokemonBox.get(number);
  }

  Future<List<PokemonHiveModel>> getEvolutions(PokemonHiveModel pokemon) async {
    final pokemonFutures = pokemon.evolutions.map((pokemonNumber) => getPokemon(pokemonNumber));

    final pokemons = await Future.wait(pokemonFutures);

    return pokemons.whereType<PokemonHiveModel>().toList();
  }

  Future<void> saveItems(Iterable<ItemHiveModel> items) async {
    final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);

    final itemsMap = {for (var e in items) e.name: e};
    await itemBox.clear();
    await itemBox.putAll(itemsMap);
  }

  Future<List<ItemHiveModel>> getAllItems() async {
    final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);

    final items = List.generate(itemBox.length, (index) => itemBox.getAt(index))
        .whereType<ItemHiveModel>()
        .toList();

    return items;
  }

  Future<List<ItemHiveModel>> getItems({required int page, required int limit}) async {
    final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);
    final totalItems = itemBox.length;

    final start = (page - 1) * limit;
    final newItemCount = min(totalItems - start, limit);

    final items = List.generate(newItemCount, (index) => itemBox.getAt(start + index))
        .whereType<ItemHiveModel>()
        .toList();

    return items;
  }
}
