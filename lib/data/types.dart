import '../models/type.dart';

const List<String> types = [
  'Normal',
  'Fire',
  'Water',
  'Electric',
  'Grass',
  'Ice',
  'Fighting',
  'Poison',
  'Ground',
  'Flying',
  'Psychic',
  'Bug',
  'Rock',
  'Ghost',
  'Dragon',
  'Dark',
  'Steel',
  'Fairy'
];

const List<EffectiveType> effectiveTypes = [
  EffectiveType(
    name: 'Normal',
    superEffective: [
      'Fighting',
    ],
    notEffective: [],
    immune: [
      'Ghost',
    ],
  ),
  EffectiveType(
    name: 'Fire',
    superEffective: [
      'Ground',
      'Rock',
      'Water',
    ],
    notEffective: [
      'Bug',
      'Fairy',
      'Fire',
      'Grass',
      'Ice',
      'Steel',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Water',
    superEffective: [
      'Electric',
      'Grass',
    ],
    notEffective: [
      'Fire',
      'Ice',
      'Steel',
      'Water',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Electric',
    superEffective: [
      'Ground',
    ],
    notEffective: [
      'Electric',
      'Flying',
      'Steel',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Grass',
    superEffective: [
      'Bug',
      'Ice',
      'Fly',
      'Fire',
      'Poison',
    ],
    notEffective: [
      'Electric',
      'Grass',
      'Ground',
      'Water',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Ice',
    superEffective: [
      'Fire',
      'Fighting',
      'Rock',
      'Steel',
    ],
    notEffective: [
      'Ice',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Fighting',
    superEffective: [
      'Flying',
      'Psychic',
      'Fairy',
    ],
    notEffective: [
      'Bug',
      'Rock',
      'Dark',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Poison',
    superEffective: [
      'Ground',
      'Psychic',
    ],
    notEffective: [
      'Fighting',
      'Poison',
      'Bug',
      'Fairy',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Ground',
    superEffective: [
      'Water',
      'Grass',
      'Ice',
    ],
    notEffective: [
      'Poison',
      'Rock',
    ],
    immune: [
      'Electric',
    ],
  ),
  EffectiveType(
    name: 'Flying',
    superEffective: [
      'Electric',
      'Ice',
      'Rock',
    ],
    notEffective: [
      'Grass',
      'Fighting',
      'Bug',
    ],
    immune: [
      'Ground',
    ],
  ),
  EffectiveType(
    name: 'Psychic',
    superEffective: [
      'Bug',
      'Ghost',
      'Dark',
    ],
    notEffective: [
      'Fighting',
      'Psychic',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Bug',
    superEffective: [
      'Fire',
      'Flying',
      'Rock',
    ],
    notEffective: [
      'Grass',
      'Fighting',
      'Ground',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Rock',
    superEffective: [
      'Water',
      'Grass',
      'Fighting',
      'Ground',
      'Steel',
    ],
    notEffective: [
      'Normal',
      'Fire',
      'Poison',
      'Flying',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Ghost',
    superEffective: [
      'Ghost',
      'Dark',
    ],
    notEffective: [
      'Poison',
      'Bug',
    ],
    immune: [
      'Normal',
      'Fighting',
    ],
  ),
  EffectiveType(
    name: 'Dragon',
    superEffective: [
      'Ice',
      'Dragon',
      'Fairy',
    ],
    notEffective: [
      'Fire',
      'Water',
      'Electric',
      'Grass',
    ],
    immune: [],
  ),
  EffectiveType(
    name: 'Dark',
    superEffective: [
      'Fighting',
      'Bug',
      'Fairy',
    ],
    notEffective: [
      'Ghost',
      'Dark',
    ],
    immune: [
      'Psychic',
    ],
  ),
  EffectiveType(
    name: 'Steel',
    superEffective: [
      'Fire',
      'Fighting',
      'Ground',
    ],
    notEffective: [
      'Normal',
      'Grass',
      'Ice',
      'Flying',
      'Psychic',
      'Bug',
      'Rock',
      'Dragon',
      'Steel',
      'Fairy',
    ],
    immune: [
      'Poison',
    ],
  ),
  EffectiveType(
    name: 'Fairy',
    superEffective: [
      'Poison',
      'Steel',
    ],
    notEffective: [
      'Fighting',
      'Bug',
      'Dark',
    ],
    immune: [
      'Dragon',
    ],
  ),
];

EffectiveType getEffectiveTypeFromType(String type) {
  for (EffectiveType effectiveType in effectiveTypes) {
    if (effectiveType.name.toLowerCase() == type.toLowerCase()) {
      return effectiveType;
    }
  }
  return null;
}
