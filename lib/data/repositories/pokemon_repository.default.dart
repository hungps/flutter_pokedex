import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/pokeapi_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/data/entities/pokemon.dart';

@Singleton(as: PokemonRepository)
class PokemonDefaultRepository extends PokemonRepository {
  final PokeApiDataSource _pokeApiDataSource;
  final LocalDataSource _localDataSource;
  int? _cachedMaxPokemonId;

  const PokemonDefaultRepository({
    required PokeApiDataSource pokeApiDataSource,
    required LocalDataSource localDataSource,
  })  : _pokeApiDataSource = pokeApiDataSource,
        _localDataSource = localDataSource;

  Future<int> _getMaxPokemonId() async {
    _cachedMaxPokemonId ??= await _pokeApiDataSource.getPokemonCount();
    return _cachedMaxPokemonId!;
  }

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    final pokemonHiveModels = await _localDataSource.getAllPokemons();
    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }

  @override
  Future<List<Pokemon>> getPokemons({required int limit, required int page}) async {
    final maxPokemonId = await _getMaxPokemonId();
    final start = (page - 1) * limit + 1;
    final end = start + limit - 1;
    final actualEnd = end > maxPokemonId ? maxPokemonId : end;

    final pokemonList = <Pokemon>[];
    
    for (int id = start; id <= actualEnd; id++) {
      final number = '#${id.toString().padLeft(3, '0')}';
      final pokemon = await getPokemon(number);
      
      if (pokemon != null) {
        pokemonList.add(pokemon);
      }
    }

    return pokemonList;
  }

  @override
  Future<Pokemon?> getPokemon(String number) async {
    var pokemonModel = await _localDataSource.getPokemon(number);

    if (pokemonModel == null) {
      final maxPokemonId = await _getMaxPokemonId();
      final id = int.tryParse(number.replaceAll('#', ''));
      if (id != null && id >= 1 && id <= maxPokemonId) {
        await _fetchAndCachePokemon(id);
        pokemonModel = await _localDataSource.getPokemon(number);
      }
    }

    if (pokemonModel == null) return null;

    // get all evolutions
    final evolutionNumbers = pokemonModel.evolutions;
    final evolutions = <dynamic>[];
    
    for (final evolutionNumber in evolutionNumbers) {
      final evolution = await _localDataSource.getPokemon(evolutionNumber);
      if (evolution != null) {
        evolutions.add(evolution);
      } else {
        final maxPokemonId = await _getMaxPokemonId();
        final evolutionId = int.tryParse(evolutionNumber.replaceAll('#', ''));
        if (evolutionId != null && evolutionId >= 1 && evolutionId <= maxPokemonId) {
          await _fetchAndCachePokemon(evolutionId);
          final fetchedEvolution = await _localDataSource.getPokemon(evolutionNumber);
          if (fetchedEvolution != null) {
            evolutions.add(fetchedEvolution);
          }
        }
      }
    }

    final pokemon = pokemonModel.toEntity(evolutions: evolutions);

    return pokemon;
  }

  Future<void> _fetchAndCachePokemon(int id) async {
    try {
      // Fetch Pokemon basic data
      final pokemon = await _pokeApiDataSource.getPokemon(id);
      final species = await _pokeApiDataSource.getPokemonSpecies(id);

      // Get type data for weaknesses
      final typeFutures = pokemon.types.map((t) => _pokeApiDataSource.getType(t.type.name));
      final types = await Future.wait(typeFutures);
      final weaknesses = PokeApiToLocalMapper.getWeaknesses(types);

      // Get evolution chain
      List<String> evolutionIds = [];
      String evolutionReason = '';

      if (species.evolutionChain != null) {
        final chainUrl = species.evolutionChain!.url;
        final chainIdMatch = RegExp(r'/(\d+)/$').firstMatch(chainUrl);
        if (chainIdMatch != null) {
          final chainId = int.parse(chainIdMatch.group(1)!);
          final evolutionChain = await _pokeApiDataSource.getEvolutionChain(chainId);
          evolutionIds = PokeApiToLocalMapper.extractEvolutionIds(evolutionChain.chain);

          // Find evolution reason for this specific Pokemon
          if (species.evolvesFromSpecies != null) {
            evolutionReason = _findEvolutionReason(evolutionChain.chain, pokemon.name);
          }
        }
      }

      // Convert to Hive model
      final hiveModel = PokeApiToLocalMapper.pokemonToHiveModel(
        pokemon: pokemon,
        species: species,
        evolutionIds: evolutionIds,
        weaknesses: weaknesses,
      );

      // Update evolution reason if found
      if (evolutionReason.isNotEmpty) {
        hiveModel.evolutionReason = evolutionReason;
      }

      // Save to local storage
      final currentPokemons = await _localDataSource.getAllPokemons();
      final pokemonsMap = {for (var p in currentPokemons) p.number: p};
      pokemonsMap[hiveModel.number] = hiveModel;
      await _localDataSource.savePokemons(pokemonsMap.values);
    } catch (e) {
      print('Error fetching Pokemon $id: $e');
      rethrow;
    }
  }

  String _findEvolutionReason(dynamic chain, String pokemonName) {
    // Handle ChainLink from evolution_chain model
    try {
      final speciesName = chain.species.name as String;
      if (speciesName == pokemonName && chain.evolutionDetails != null) {
        final details = chain.evolutionDetails as List;
        if (details.isNotEmpty) {
          return PokeApiToLocalMapper.getEvolutionReason(details);
        }
      }

      // Check children
      final evolvesTo = chain.evolvesTo as List;
      for (final evolution in evolvesTo) {
        final reason = _findEvolutionReason(evolution, pokemonName);
        if (reason.isNotEmpty) return reason;
      }
    } catch (e) {
      // Ignore errors in evolution reason extraction
    }

    return '';
  }
}
