import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/ui/widgets/modal.dart';
import 'package:pokedex/ui/widgets/search_bar.dart';

import '../../routes.dart';

class SearchBottomModal extends StatefulWidget {
  @override
  State<SearchBottomModal> createState() => _SearchBottomModalState();
}

class _SearchBottomModalState extends State<SearchBottomModal> {
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read(allPokemonsStateProvider).getAllPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    Widget _buildError() => Container(
          padding: EdgeInsets.only(bottom: 28),
          alignment: Alignment.center,
          child: Icon(
            Icons.warning_amber_rounded,
            size: 60,
            color: Colors.black26,
          ),
        );

    void _onPokemonPress(int index, Pokemon pokemon) {
      print("Pokemon: ${pokemon.name}");
      print("index: $index");
      context.read(currentPokemonStateProvider).setPokemon(index, pokemon);

      AppNavigator.push(Routes.pokemonInfo, pokemon);
    }

    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 1,
      maxChildSize: 1,
      builder: (_, scroller) {
        return Modal(
          child: Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: context.responsive(14),
                bottom: context.responsive(14) + viewInsets + safeAreaBottom,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                controller: scroller,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SearchBar(
                      margin: EdgeInsets.zero,
                      onSubmit: (content) {
                        context
                            .read(searchPokemonsStateProvider)
                            .searchPokemons(content);
                      },
                    ),
                  ),
                  Consumer(builder: (_, watch, __) {
                    final searchPokemonsState =
                        watch(searchPokemonsStateProvider);
                    final pokemonsState = watch(allPokemonsStateProvider);
                    print(pokemonsState.pokemons.length);
                    if (searchPokemonsState.isError) {
                      return _buildError();
                    } else {
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        children: searchPokemonsState.pokemons.map((pokemon) {
                          var index = pokemonsState.pokemons.indexWhere(
                              (element) => element.name == pokemon.name);
                          return PokemonCard(pokemon,
                              index: index,
                              onPress: () => _onPokemonPress(index, pokemon));
                        }).toList(),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
