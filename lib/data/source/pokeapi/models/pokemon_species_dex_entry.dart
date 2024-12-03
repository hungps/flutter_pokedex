import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_dex_entry.freezed.dart';
part 'pokemon_species_dex_entry.g.dart';

@freezed
class PokemonSpeciesDexEntry with _$PokemonSpeciesDexEntry {
  const factory PokemonSpeciesDexEntry({
    @JsonKey(name: 'entry_number') required int entryNumber,
  }) = _PokemonSpeciesDexEntry;

  factory PokemonSpeciesDexEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesDexEntryFromJson(json);
}
