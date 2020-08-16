// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_gender.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonGenderHiveModelAdapter
    extends TypeAdapter<PokemonGenderHiveModel> {
  @override
  final int typeId = 2;

  @override
  PokemonGenderHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonGenderHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
