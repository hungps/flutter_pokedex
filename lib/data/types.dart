import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';

class PokeTypes {
  const PokeTypes({
    required this.type,
    required this.superEffective,
    required this.notEffective,
    required this.nilEffective,
    required this.color,
  });
  final PokemonTypes type;
  final List<String> superEffective;
  final List<String> notEffective;
  final List<String> nilEffective;
  final Color color;
}

List<PokeTypes> tps = [];
const List<PokeTypes> types = [
  PokeTypes(
    type: PokemonTypes.normal,
    superEffective: [],
    notEffective: ["Rock", "Steel"],
    nilEffective: ["Ghost"],
    color: Color(0xFFa8a8a8),
  ),
  PokeTypes(
    type: PokemonTypes.fire,
    superEffective: ["Bug", "Steel", "Grass", "Ice"],
    notEffective: ["Rock", "Fire", "Water", "Dragon"],
    nilEffective: [],
    color: Color(0xFFf08030),
  ),
  PokeTypes(
    type: PokemonTypes.water,
    notEffective: ["Water", "Grass", "Dragon"],
    superEffective: ["Ground", "Rock", "Fire"],
    nilEffective: [],
    color: Color(0xFF6890f0),
  ),
  PokeTypes(
    type: PokemonTypes.electric,
    notEffective: ["Grass", "Electric", "Dragon"],
    superEffective: ["Flying", "Water"],
    nilEffective: ["Ground"],
    color: Color(0xFFf8b00f),
  ),
  PokeTypes(
    type: PokemonTypes.grass,
    nilEffective: [],
    superEffective: ["Ground", "Rock", "Water"],
    notEffective: ["Flying", "Poison", "Bug", "Steel", "Fire", "Grass", "Dragon"],
    color: Color(0xFF78c851),
  ),
  PokeTypes(
    type: PokemonTypes.ice,
    notEffective: ["Steel", "Fire", "Water", "Ice"],
    superEffective: ["Flying", "Ground", "Grass", "Dragon"],
    nilEffective: [],
    color: Color(0xFF98d9d8),
  ),
  PokeTypes(
    type: PokemonTypes.fighting,
    notEffective: ["Flying", "Poison", "Bug", "Psychic", "Fairy"],
    superEffective: ["Normal", "Rock", "Steel", "Ice", "Dark"],
    nilEffective: ["Ghost"],
    color: Color(0xFFe83001),
  ),
  PokeTypes(
    type: PokemonTypes.poison,
    superEffective: ["Grass", "Fairy"],
    nilEffective: ["Steel"],
    notEffective: ["Poison", "Ground", "Rock", "Ghost"],
    color: Color(0xFFa040a0),
  ),
  PokeTypes(
    type: PokemonTypes.ground,
    nilEffective: ["Flying"],
    superEffective: ["Poison", "Rock", "Steel", "Fire", "Electric"],
    notEffective: ["Bug", "Grass"],
    color: Color(0xFFd8e02f),
  ),
  PokeTypes(
    type: PokemonTypes.flying,
    notEffective: ["Rock", "Steel", "Electric"],
    superEffective: ["Fighting", "Bug", "Grass"],
    nilEffective: [],
    color: Color(0xFF9f94be),
  ),
  PokeTypes(
    type: PokemonTypes.psychic,
    notEffective: ["Steel", "Psychic"],
    superEffective: ["Fighting", "Poison"],
    nilEffective: ["Dark"],
    color: Color(0xFFf85888),
  ),
  PokeTypes(
    type: PokemonTypes.bug,
    nilEffective: [],
    superEffective: ["Grass", "Psychic", "Dark"],
    notEffective: ["Fighting", "Flying", "Poison", "Ghost", "Steel", "Fire", "Fairy"],
    color: Color(0xFFa8b821),
  ),
  PokeTypes(
    type: PokemonTypes.rock,
    nilEffective: [],
    superEffective: ["Flying", "Bug", "Fire", "Ice"],
    notEffective: ["Fighting", "Ground", "Steel"],
    color: Color(0xFFb8a038),
  ),
  PokeTypes(
    type: PokemonTypes.ghost,
    notEffective: ["Dark"],
    nilEffective: ["Normal"],
    superEffective: ["Ghost", "Psychic"],
    color: Color(0xFF5d4674),
  ),
  PokeTypes(
    type: PokemonTypes.dragon,
    superEffective: ["Dragon"],
    nilEffective: ["Fairy"],
    notEffective: ["Steel"],
    color: Color(0xFF623bd5),
  ),
  PokeTypes(
    type: PokemonTypes.dark,
    superEffective: ["Ghost", "Psychic"],
    nilEffective: [],
    notEffective: ["Fighting", "Dark", "Fairy"],
    color: Color(0xFF776554),
  ),
  PokeTypes(
    type: PokemonTypes.steel,
    superEffective: ["Rock", "Ice", "Fairy"],
    nilEffective: [],
    notEffective: ["Steel", "Fire", "Water", "Electric"],
    color: Color(0xFFb1adbb),
  ),
  PokeTypes(
    type: PokemonTypes.fairy,
    notEffective: ["Poison", "Steel", "Fire"],
    nilEffective: [],
    superEffective: ["Fighting", "Dragon", "Dark"],
    color: Color(0xFFf8b8e8),
  )
];
