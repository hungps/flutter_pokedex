// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_gender.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonGenderHiveModelAdapter
    extends TypeAdapter<PokemonGenderHiveModel> {
  @override
  PokemonGenderHiveModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonGenderHiveModel()
      ..genderless = fields[0] as bool
      ..male = fields[1] as double
      ..female = fields[2] as double;
  }

  @override
  void write(BinaryWriter writer, PokemonGenderHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.genderless)
      ..writeByte(1)
      ..write(obj.male)
      ..writeByte(2)
      ..write(obj.female);
  }
}
