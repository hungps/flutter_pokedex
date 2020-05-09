import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';

String _formattedPokeIndex(int index) {
  return "#${((index + 1) / 100).toStringAsFixed(2).replaceAll(".", "")}";
}

class PokemonCard extends StatelessWidget {
  const PokemonCard(
    this.pokemon, {
    @required this.index,
    Key key,
    this.onPress,
  }) : super(key: key);

  final int index;
  final Function onPress;
  final Pokemon pokemon;

  List<Widget> _buildTypes() {
    final widgetTypes = pokemon.types
        .map(
          (type) => Hero(
            tag: pokemon.number + type.value,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: PokemonType(type.value),
            ),
          ),
        )
        .toList();

    return widgetTypes;
  }

  Widget _buildCardContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 10),
            ..._buildTypes(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDecorations(double itemHeight) {
    return [
      Positioned(
        bottom: -itemHeight * 0.13,
        right: -itemHeight * 0.03,
        child: Image(
          image: AppImages.pokeball,
          width: itemHeight * 0.75,
          height: itemHeight * 0.75,
          color: Colors.white.withOpacity(0.14),
        ),
      ),
      Positioned(
        bottom: -2,
        right: 2,
        child: Hero(
          tag: pokemon.image,
          child: CachedNetworkImage(
            imageUrl: pokemon.image,
            width: itemHeight * 0.76,
            height: itemHeight * 0.78,
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
            placeholder: (context, url) => Image(
              image: AppImages.bulbasaur,
              width: itemHeight * 0.6,
              height: itemHeight * 0.6,
              color: Colors.black12,
            ),
            errorWidget: (_, __, error) => Icon(Icons.error),
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 14,
        child: Text(
          _formattedPokeIndex(index),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black12,
          ),
        ),
      ),
    ];
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
                    _buildCardContent(),
                    ..._buildDecorations(itemHeight),
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
