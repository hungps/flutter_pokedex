part of '../pokemon_info.dart';

class _PokemonBall extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonBall(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final pokeballSize = screenHeight * 0.1;
    final pokemonSize = pokeballSize * 0.85;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: Assets.images.pokeball.provider(),
              width: pokeballSize,
              height: pokeballSize,
              color: context.colors.backgroundDark,
            ),
            PokemonImage(
              pokemon: pokemon,
              size: Size.square(pokemonSize),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(pokemon.name),
      ],
    );
  }
}

class _PokemonEvolution extends StatefulWidget {
  final Pokemon pokemon;

  const _PokemonEvolution(this.pokemon);

  @override
  _PokemonEvolutionState createState() => _PokemonEvolutionState();
}

class _PokemonEvolutionState extends State<_PokemonEvolution> {
  Pokemon get pokemon => widget.pokemon;

  Widget _buildRow({
    required Pokemon current,
    required Pokemon next,
    required String reason,
  }) {
    return Row(
      children: <Widget>[
        Expanded(child: _PokemonBall(current)),
        Expanded(
          child: Column(
            children: <Widget>[
              const Icon(Icons.arrow_forward),
              const SizedBox(height: 7),
              Text(reason, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(child: _PokemonBall(next)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final slideController = PokemonInfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          physics:
              scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 28),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Evolution Chain',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 0.8,
            ),
          ),
          const SizedBox(height: 28),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(height: 58),
            itemCount: pokemon.evolutions.length - 1,
            itemBuilder: (_, index) => _buildRow(
              current: pokemon.evolutions[index],
              next: pokemon.evolutions[index + 1],
              reason: pokemon.evolutions[index + 1].evolutionReason,
            ),
          ),
        ],
      ),
    );
  }
}
