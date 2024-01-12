import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_generation.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/colors.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class GenerationCard extends StatelessWidget {
  const GenerationCard(this.generation, {super.key});

  final PokemonGeneration generation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;

      return Container(
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: context.styles.cardShadow,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    generation.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: generation.pokemonImages
                        .map(
                          (pokemon) => Expanded(
                            child: Image.asset(
                              pokemon,
                              fit: BoxFit.contain,
                              width: height * 0.41,
                              height: height * 0.41,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -height * 0.136,
              right: -height * 0.03,
              child: Image(
                image: Assets.images.pokeball.provider(),
                width: height * 0.754,
                height: height * 0.754,
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ],
        ),
      );
    });
  }
}
