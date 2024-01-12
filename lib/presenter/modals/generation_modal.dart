import 'package:flutter/material.dart';
import 'package:pokedex/data/generations.dart';
import 'package:pokedex/data/entities/pokemon_generation.dart';
import 'package:pokedex/presenter/pages/pokedex/widgets/generation_card.dart';
import 'package:pokedex/presenter/widgets/modal.dart';

class GenerationModal extends StatelessWidget {
  const GenerationModal({super.key});

  Widget _buildGenerationCard(PokemonGeneration generation) {
    return GenerationCard(generation);
  }

  Widget _buildGenerations(BuildContext context, ScrollController scrollController) {
    final safeAreaBottom = MediaQuery.paddingOf(context).bottom;

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(26, 26, 26, 26 + safeAreaBottom),
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemonGenerations.length,
        itemBuilder: (_, index) => _buildGenerationCard(pokemonGenerations[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.7,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (_, scrollController) {
        return Modal(
          title: 'Generation',
          child: _buildGenerations(context, scrollController),
        );
      },
    );
  }
}
