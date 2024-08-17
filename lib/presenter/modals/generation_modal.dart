import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_generation.dart';
import 'package:pokedex/data/generations.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/modal.dart';

void showPokemonGenerationSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => const PokemonGenerationBottomSheet(),
  );
}

class PokemonGenerationBottomSheet extends StatelessWidget {
  const PokemonGenerationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDraggableBottomSheet(
      title: 'Generation',
      useSafeArea: false,
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemonGenerations.length,
        itemBuilder: (_, index) => GenerationCard(pokemonGenerations[index]),
      ),
    );
  }
}

class GenerationCard extends StatelessWidget {
  const GenerationCard(this.generation, {super.key});

  final PokemonGeneration generation;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: context.styles.cardShadow,
        color: context.colors.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -24,
            right: -6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: Assets.images.pokeball.provider(),
                width: 90,
                height: 90,
                fit: BoxFit.contain,
                opacity: const AlwaysStoppedAnimation(0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                  generation.title,
                  style: context.typographies.captionLarge,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: generation.pokemonImages
                        .map(
                          (pokemon) => Expanded(
                            child: Image.asset(pokemon, fit: BoxFit.contain),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
