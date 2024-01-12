part of '../pokemon_info.dart';

class _PokemonInfoCard extends StatefulWidget {
  static const double minCardHeightFraction = 0.54;

  const _PokemonInfoCard();

  @override
  State<_PokemonInfoCard> createState() => _PokemonInfoCardState();
}

class _PokemonInfoCardState extends State<_PokemonInfoCard> {
  AnimationController get slideController => PokemonInfoStateProvider.of(context).slideController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * _PokemonInfoCard.minCardHeightFraction;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return AutoSlideUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      onPanelSlide: (position) => slideController.value = position,
      child: CurrentPokemonSelector((pokemon) {
        return MainTabView(
          paddingAnimation: slideController,
          tabs: [
            MainTabData(
              label: 'About',
              child: _PokemonAbout(pokemon),
            ),
            MainTabData(
              label: 'Base Stats',
              child: _PokemonBaseStats(pokemon),
            ),
            MainTabData(
              label: 'Evolution',
              child: _PokemonEvolution(pokemon),
            ),
            const MainTabData(
              label: 'Moves',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Under development'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
