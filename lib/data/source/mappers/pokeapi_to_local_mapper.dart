import 'package:pokedex/data/source/pokeapi/models/evolution_chain.dart';
import 'package:pokedex/data/source/pokeapi/models/item.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_species.dart';
import 'package:pokedex/data/source/pokeapi/models/type.dart';
import 'package:pokedex/data/source/local/models/item.dart';
import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_gender.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';

class PokeApiToLocalMapper {
  /// Converts PokeAPI models to Hive model
  static PokemonHiveModel pokemonToHiveModel({
    required PokeApiPokemonModel pokemon,
    required PokeApiPokemonSpeciesModel species,
    List<String>? evolutionIds,
    List<String>? weaknesses,
  }) {
    // Format Pokemon number with leading zeros (e.g., "#001")
    final pokemonNumber = '#${pokemon.id.toString().padLeft(3, '0')}';

    // Extract stats
    final statsMap = <String, int>{};
    for (final stat in pokemon.stats) {
      statsMap[stat.stat.name] = stat.baseStat;
    }

    // Extract types
    final types = pokemon.types.map((t) => _capitalizeFirst(t.type.name)).toList();

    // Get English description
    final description = species.flavorTextEntries
        .where((entry) => entry.language.name == 'en')
        .map((entry) => entry.flavorText.replaceAll('\n', ' ').replaceAll('\f', ' '))
        .firstOrNull ?? '';

    // Get English genus (category)
    final genus = species.genera
        .where((g) => g.language.name == 'en')
        .map((g) => g.genus.replaceAll(' Pokémon', '').replaceAll(' Pokemon', ''))
        .firstOrNull ?? '';

    // Calculate gender percentages
    final genderRate = species.genderRate;
    final isMale = genderRate >= 0 ? (8 - genderRate) / 8 * 100 : 0.0;
    final isFemale = genderRate >= 0 ? genderRate / 8 * 100 : 0.0;
    final isGenderless = genderRate < 0;

    // Extract abilities
    final abilities = pokemon.abilities
        .where((a) => !a.isHidden)
        .map((a) => _capitalizeFirst(a.ability.name.replaceAll('-', ' ')))
        .toList();

    // Get image URL (prefer official artwork)
    final imageUrl = pokemon.sprites.other?.officialArtwork?.frontDefault ??
        pokemon.sprites.frontDefault ??
        '';

    // Convert height from decimeters to feet and inches
    final heightInInches = (pokemon.height * 10 / 2.54).round();
    final feet = heightInInches ~/ 12;
    final inches = heightInInches % 12;
    final height = "$feet' ${inches.toString().padLeft(2, '0')}\"";

    // Convert weight from hectograms to pounds
    final weight = '${(pokemon.weight / 10 * 2.20462).toStringAsFixed(1)} lbs';

    // Extract egg groups
    final eggGroups =
        species.eggGroups.map((e) => _capitalizeFirst(e.name.replaceAll('-', ' '))).toList();

    // Get evolution reason
    String evolutionReason = '';
    if (species.evolvesFromSpecies != null) {
      // This will be filled in later when we have evolution chain data
      evolutionReason = '';
    }

    return PokemonHiveModel()
      ..number = pokemonNumber
      ..name = _capitalizeFirst(pokemon.name)
      ..description = description
      ..types = types
      ..image = imageUrl
      ..height = height
      ..weight = weight
      ..genera = genus
      ..eggGroups = eggGroups
      ..gender = (PokemonGenderHiveModel()
        ..male = isMale
        ..female = isFemale
        ..genderless = isGenderless)
      ..stats = (PokemonStatsHiveModel()
        ..hp = statsMap['hp'] ?? 0
        ..speed = statsMap['speed'] ?? 0
        ..attack = statsMap['attack'] ?? 0
        ..defense = statsMap['defense'] ?? 0
        ..specialAttack = statsMap['special-attack'] ?? 0
        ..specialDefense = statsMap['special-defense'] ?? 0)
      ..baseExp = (pokemon.baseExperience ?? 0).toDouble()
      ..evolutions = evolutionIds ?? []
      ..evolutionReason = evolutionReason;
  }

  /// Extracts evolution IDs from evolution chain
  static List<String> extractEvolutionIds(ChainLink chain, [List<String>? ids]) {
    ids ??= [];
    
    // Extract ID from species URL
    final speciesUrl = chain.species.url;
    final match = RegExp(r'/(\d+)/$').firstMatch(speciesUrl);
    if (match != null) {
      final id = int.parse(match.group(1)!);
      ids.add('#${id.toString().padLeft(3, '0')}');
    }

    // Recursively get evolution IDs
    for (final evolution in chain.evolvesTo) {
      extractEvolutionIds(evolution, ids);
    }

    return ids;
  }

  /// Gets evolution reason from evolution details
  static String getEvolutionReason(List<EvolutionDetail> details) {
    if (details.isEmpty) return '';

    final detail = details.first;

    if (detail.minLevel != null) {
      return '(Level ${detail.minLevel})';
    }

    if (detail.item != null) {
      return '(${_capitalizeFirst(detail.item!.name.replaceAll('-', ' '))})';
    }

    if (detail.trigger.name == 'trade') {
      return '(Trade)';
    }

    if (detail.minHappiness != null) {
      return '(Happiness)';
    }

    return '';
  }

  /// Converts type damage relations to weakness list
  static List<String> getWeaknesses(List<PokeApiTypeModel> types) {
    final weaknessMap = <String, double>{};

    for (final type in types) {
      // Double damage from = weakness
      for (final weakness in type.damageRelations.doubleDamageFrom) {
        final name = weakness.name;
        weaknessMap[name] = (weaknessMap[name] ?? 1.0) * 2.0;
      }

      // Half damage from = resistance
      for (final resistance in type.damageRelations.halfDamageFrom) {
        final name = resistance.name;
        weaknessMap[name] = (weaknessMap[name] ?? 1.0) * 0.5;
      }

      // No damage from = immunity
      for (final immunity in type.damageRelations.noDamageFrom) {
        final name = immunity.name;
        weaknessMap[name] = 0.0;
      }
    }

    // Only return actual weaknesses (damage multiplier > 1)
    return weaknessMap.entries
        .where((entry) => entry.value > 1.0)
        .map((entry) => _capitalizeFirst(entry.key))
        .toList();
  }

  /// Converts PokeAPI item to Hive model
  static ItemHiveModel itemToHiveModel(PokeApiItemModel item) {
    // Get English name
    final name = item.names
        .where((n) => n.language.name == 'en')
        .map((n) => n.name)
        .firstOrNull ?? _capitalizeFirst(item.name.replaceAll('-', ' '));

    // Get English effect
    final effect = item.effectEntries
        .where((e) => e.language.name == 'en')
        .map((e) => e.shortEffect)
        .firstOrNull ?? '';

    // Get category
    final categoryName = item.category.name.replaceAll('-', ' ');
    final category = _capitalizeFirst(categoryName);

    // Get sprite
    final imageUrl = item.sprites.default_ ?? '';

    return ItemHiveModel()
      ..name = name
      ..category = category
      ..imageurl = imageUrl
      ..effect = effect;
  }

  static String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
