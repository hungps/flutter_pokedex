// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonStatsHiveModelAdapter extends TypeAdapter<PokemonStatsHiveModel> {
  @override
  PokemonStatsHiveModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonStatsHiveModel()
      ..attack = fields[0] as int
      ..specialAttack = fields[1] as int
      ..defense = fields[2] as int
      ..specialDefense = fields[3] as int
      ..hp = fields[4] as int
      ..speed = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, PokemonStatsHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.attack)
      ..writeByte(1)
      ..write(obj.specialAttack)
      ..writeByte(2)
      ..write(obj.defense)
      ..writeByte(3)
      ..write(obj.specialDefense)
      ..writeByte(4)
      ..write(obj.hp)
      ..writeByte(5)
      ..write(obj.speed);
  }
}
