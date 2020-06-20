import '../models/type.dart';

const List<String> listOfTypes = ["Normal", "Fire", "Water", "Electric",
  "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug",
  "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"];

const List<Type> types = [
  Type(
    name: "Normal",
    superEffective: ["Fighting"],
    notEffective: [],
    immune: ["Ghost"],
  ),
  Type(
    name: "Fire",
    superEffective: ["Ground", "Rock", "Water"],
    notEffective: ["Bug", "Fairy", "Fire", "Grass", "Ice", "Steel"],
    immune: [],
  ),
  Type(
    name: "Water",
    superEffective: ["Electric", "Grass"],
    notEffective: ["Fire", "Ice", "Steel", "Water"],
    immune: [],
  ),
  Type(
    name: "Electric",
    superEffective: ["Ground"],
    notEffective: ["Electric", "Flying", "Steel"],
    immune: [],
  ),
  Type(
    name: "Grass",
    superEffective: ["Bug", "Ice", "Fly", "Fire", "Poison"],
    notEffective: ["Electric", "Grass", "Ground", "Water"],
    immune: [],
  ),
  Type(
    name: "Ice",
    superEffective: ["Fire", "Fighting", "Rock", "Steel"],
    notEffective: ["Ice"],
    immune: [],
  ),
  Type(
    name: "Fighting",
    superEffective: ["Flying", "Psychic", "Fairy"],
    notEffective: ["Bug", "Rock", "Dark"],
    immune: [],
  ),
  Type(
    name: "Poison",
    superEffective: ["Ground", "Psychic"],
    notEffective: ["Fighting", "Poison", "Bug", "Fairy"],
    immune: [],
  ),
  Type(
    name: "Ground",
    superEffective: ["Water", "Grass", "Ice"],
    notEffective: ["Poison", "Rock"],
    immune: ["Electric"],
  ),
  Type(
    name: "Flying",
    superEffective: ["Electric", "Ice", "Rock"],
    notEffective: ["Grass", "Fighting", "Bug"],
    immune: ["Ground"],
  ),
  Type(
    name: "Psychic",
    superEffective: ["Bug", "Ghost", "Dark"],
    notEffective: ["Fighting", "Psychic"],
    immune: [],
  ),
  Type(
    name: "Bug",
    superEffective: ["Fire", "Flying", "Rock"],
    notEffective: ["Grass", "Fighting", "Ground"],
    immune: [],
  ),
  Type(
    name: "Rock",
    superEffective: ["Water", "Grass", "Fighting", "Ground", "Steel"],
    notEffective: ["Normal", "Fire", "Poison", "Flying"],
    immune: [],
  ),
  Type(
    name: "Ghost",
    superEffective: ["Ghost", "Dark"],
    notEffective: ["Poison", "Bug"],
    immune: ["Normal", "Fighting"],
  ),
  Type(
    name: "Dragon",
    superEffective: ["Ice", "Dragon", "Fairy"],
    notEffective: ["Fire", "Water", "Electric", "Grass"],
    immune: [],
  ),
  Type(
    name: "Dark",
    superEffective: ["Fighting", "Bug", "Fairy"],
    notEffective: ["Ghost", "Dark"],
    immune: ["Psychic"],
  ),
  Type(
    name: "Steel",
    superEffective: ["Fire", "Fighting", "Ground"],
    notEffective: ["Normal", "Grass", "Ice", "Flying", "Psychic", "Bug", "Rock", "Dragon", "Steel","Fairy"],
    immune: ["Poison"],
  ),
  Type(
    name: "Fairy",
    superEffective: ["Poison", "Steel"],
    notEffective: ["Fighting", "Bug", "Dark"],
    immune: ["Dragon"],
  ),
];

Type getTypeFromString(String name){
  for(Type type in types){
    if(type.name.toLowerCase() == name.toLowerCase()){
      return type;
    }
  }
  return null;
}