import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/pokemon_image.dart';
import 'package:pokedex/presenter/widgets/pokemon_type.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.75;
  static const double _pokemonFraction = 0.76;

  final String name;
  final String number;
  final List<PokemonTypes> types;
  final Color color;
  final String imageUrl;
  final VoidCallback onPressed;

  const PokemonCard({
    super.key,
    required this.name,
    required this.number,
    required this.types,
    required this.color,
    required this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return DefaultTextStyle.merge(
          style: context.typographies.bodySmall
              .copyWith(color: context.colors.textOnPrimary),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                color: color,
                child: InkWell(
                  onTap: onPressed,
                  splashColor: Colors.white10,
                  highlightColor: Colors.white10,
                  child: Stack(
                    children: [
                      _buildPokeballDecoration(height: itemHeight),
                      _buildPokemon(height: itemHeight),
                      _buildPokemonNumber(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                name,
                                style: context.typographies.captionLarge,
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                itemCount: min(2, types.length),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: PokemonType(types[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: Assets.images.pokeball.provider(),
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PokemonImage(
        size: Size.square(pokemonSize),
        url: imageUrl,
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black12,
        ),
      ),
    );
  }
}
