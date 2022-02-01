import 'package:flutter/material.dart';
import 'package:pokedex/data/generations.dart';
import 'package:pokedex/domain/entities/generation.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/generation_card.dart';
import 'package:pokedex/ui/widgets/modal.dart';

class GenerationModal extends StatelessWidget {
  Widget _buildGenerationCard(Generation generation) {
    return GenerationCard(generation);
  }

  Widget _buildGenerations(BuildContext context, ScrollController scrollController) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(26, 26, 26, 26 + safeAreaBottom),
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: generations.length,
        itemBuilder: (_, index) => _buildGenerationCard(generations[index]),
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
