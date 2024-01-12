import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_event.freezed.dart';

@freezed
class PokemonEvent with _$PokemonEvent {
  const factory PokemonEvent.loadStarted({@Default(false) bool loadAll}) = PokemonLoadStarted;

  const factory PokemonEvent.loadMoreStarted() = PokemonLoadMoreStarted;

  const factory PokemonEvent.selectChanged({required String pokemonId}) = PokemonSelectChanged;
}
