import 'package:flutter/material.dart';
import 'package:pokedex/data/generations.dart';
import 'package:pokedex/presenter/pages/pokedex/widgets/generation_card.dart';
import 'package:pokedex/presenter/widgets/modal.dart';

void showPokemonGenerationBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
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
