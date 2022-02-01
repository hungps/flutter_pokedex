part of '../pokemon_info.dart';

class _PokemonBall extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonBall(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pokeballSize = screenHeight * 0.1;
    final pokemonSize = pokeballSize * 0.85;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AppImages.pokeball,
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.lightGrey,
            ),
            PokemonImage(
              pokemon: pokemon,
              size: Size.square(pokemonSize),
            ),
          ],
        ),
        SizedBox(height: 3),
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
              Icon(Icons.arrow_forward, color: AppColors.lightGrey),
              SizedBox(height: 7),
              Text(reason, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(child: _PokemonBall(next)),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: <Widget>[
        SizedBox(height: 21),
        Divider(),
        SizedBox(height: 21),
      ],
    );
  }

  List<Widget> buildEvolutionList(List<Pokemon> pokemons) {
    if (pokemons.length < 2) {
      return [
        Center(child: Text('No evolution')),
      ];
    }

    return Iterable<int>.generate(pokemons.length - 1) // skip the last one
        .map(
          (index) => _buildRow(
            current: pokemons[index],
            next: pokemons[index + 1],
            reason: pokemons[index + 1].evolutionReason,
          ),
        )
        .expand((widget) => [widget, _buildDivider()])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final slideController = PokemonInfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 31, horizontal: 28),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Evolution Chain',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 0.8,
            ),
          ),
          SizedBox(height: 28),
          ...buildEvolutionList(pokemon.evolutions),
        ],
      ),
    );
  }
}
