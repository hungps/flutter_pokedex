import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.75;
  static const double _pokemonFraction = 0.76;

  const PokemonCard(
    this.pokemon, {
    this.onPress,
    required this.index,
  });

  final int index;
  final void Function()? onPress;
  final Pokemon pokemon;

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: AppImages.pokeball,
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
      child: Hero(
        tag: pokemon.image,
        child: CachedNetworkImage(
          imageUrl: pokemon.image,
          width: pokemonSize,
          height: pokemonSize,
          imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
          useOldImageOnUrlChange: true,
          fit: BoxFit.contain,
          alignment: Alignment.bottomRight,
          placeholder: (context, url) => Image(
            image: AppImages.bulbasaur,
            width: pokemonSize,
            height: pokemonSize,
            color: Colors.black12,
          ),
          errorWidget: (_, __, error) => Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: AppImages.bulbasaur,
                width: pokemonSize,
                height: pokemonSize,
                color: Colors.black12,
              ),
              Icon(
                Icons.warning_amber_rounded,
                size: pokemonSize * 0.4,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.number,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black12,
        ),
      ),
    );
  }

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
                color: pokemon.color.withOpacity(0.12),
                blurRadius: 30,
                offset: Offset(0, 8),
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
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.pokemon, {Key? key}) : super(key: key);

  final Pokemon pokemon;

  List<Widget> _buildTypes(BuildContext context) {
    return pokemon.types
        .take(2)
        .map(
          (type) => Padding(
            padding: EdgeInsets.symmetric(vertical: context.responsive(3)),
            child: PokemonType(type),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: context.responsive(24),
          bottom: context.responsive(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: pokemon.number + pokemon.name,
              child: Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            VSpacer(context.responsive(10)),
            ..._buildTypes(context),
          ],
        ),
      ),
    );
  }
}
