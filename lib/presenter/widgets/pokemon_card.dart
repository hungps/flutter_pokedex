import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/decorators.dart';
import 'package:pokedex/presenter/widgets/pokemon_image.dart';
import 'package:pokedex/presenter/widgets/pokemon_type_chip.dart';
import 'package:pokedex/presenter/widgets/shadow_card.dart';

class PokemonCard extends StatelessWidget {
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
        return ShadowCard(
          backgroundColor: color,
          onPressed: onPressed,
          child: DefaultTextStyle.merge(
            style: context.typographies.bodySmall
                .copyWith(color: context.colors.textOnPrimary),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: _PokeballDecorator(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _PokemonImage(imageUrl: imageUrl),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: _PokemonNumber(number: number),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 6,
                    children: <Widget>[
                      Text(
                        name,
                        style: context.typographies.captionLarge,
                      ),
                      ...types.take(2).map(PokemonTypeChip.new),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PokeballDecorator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Transform.translate(
        offset: const Offset(3, 15),
        child: PokeballImage(
          color: context.colors.background.withOpacity(0.14),
        ),
      ),
    );
  }
}

class _PokemonImage extends StatelessWidget {
  const _PokemonImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.74,
      child: PokemonImage(url: imageUrl),
    );
  }
}

class _PokemonNumber extends StatelessWidget {
  const _PokemonNumber({
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Text(
        number,
        style: context.typographies.captionLarge.copyWith(
          color: Colors.black12,
        ),
      ),
    );
  }
}
