import 'package:flutter/material.dart';
import 'package:pokedex/presenter/widgets/modal.dart';
import 'package:pokedex/presenter/widgets/input.dart';

void showSearchPokemonSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) => const SearchPokemonBottomSheet(),
  );
}

class SearchPokemonBottomSheet extends StatelessWidget {
  const SearchPokemonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: AppSearchBar(
        hintText: 'Search Pokemon, Move, Ability etc',
      ),
    );
  }
}
