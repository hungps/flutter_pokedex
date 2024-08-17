import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/core/exceptions.dart';

part 'pokedex_event.freezed.dart';

@freezed
class PokedexEvent with _$PokedexEvent {
  const factory PokedexEvent.fetchPokemonsStarted() =
      PokedexFetchPokemonsStarted;

  const factory PokedexEvent.fetchMorePokemonsStarted() =
      PokedexFetchMorePokemonsStarted;

  const factory PokedexEvent.errorOccurred([AppException? error]) =
      PokedexErrorOccurred;
}
