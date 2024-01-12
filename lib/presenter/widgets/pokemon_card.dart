import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/pokemon_image.dart';
import 'package:pokedex/presenter/widgets/pokemon_type.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.75;
  static const double _pokemonFraction = 0.76;

  final Pokemon pokemon;
  final void Function()? onPress;

  const PokemonCard(
    this.pokemon, {
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: pokemon.color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pokemon.color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pokemon.color,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildPokemon(height: itemHeight),
                    _buildPokemonNumber(),
                    _CardContent(pokemon),
                  ],
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
        pokemon: pokemon,
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.number,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black12,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Pokemon pokemon;

  const _CardContent(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.typographies.bodySmall.copyWith(
        color: context.colors.textOnPrimary,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Hero(
                tag: pokemon.number + pokemon.name,
                child: Text(
                  pokemon.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ..._buildTypes(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return pokemon.types
        .take(2)
        .map(
          (type) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: PokemonType(type),
          ),
        )
        .toList();
  }
}
