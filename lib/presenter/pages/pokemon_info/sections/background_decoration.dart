part of '../pokemon_info.dart';

class _BoxDecoration extends StatelessWidget {
  static const Size size = Size.square(144);

  const _BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 5 / 12,
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -0.2),
            end: const Alignment(1.5, -0.3),
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}

class _DottedDecoration extends StatelessWidget {
  static const Size size = Size(57, 31);

  final Animation<double> animation;

  const _DottedDecoration({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedFade(
      animation: animation,
      child: Image(
        image: Assets.images.dotted.provider(),
        width: size.width,
        height: size.height,
        color: Colors.white30,
      ),
    );
  }

  // const _DottedDecoration({
  //   required Animation<double> animation,
  // }) : super(
  //         animation: animation,
  //         child: const Image(
  //           image: AppImages.dotted,
  //           width: size.width,
  //           height: size.height,
  //           color: Colors.white30,
  //         ),
  //       );
}

class _BackgroundDecoration extends StatefulWidget {
  const _BackgroundDecoration();

  @override
  State<_BackgroundDecoration> createState() => _BackgroundDecorationState();
}

class _BackgroundDecorationState extends State<_BackgroundDecoration> {
  Animation<double> get slideController => PokemonInfoStateProvider.of(context).slideController;
  Animation<double> get rotateController => PokemonInfoStateProvider.of(context).rotateController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildBoxDecoration(),
        _buildDottedDecoration(),
        _buildAppBarPokeballDecoration(),
      ],
    );
  }

  Widget _buildBackground() {
    return CurrentPokemonSelector((pokemon) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: const BoxConstraints.expand(),
        color: pokemon.color,
      );
    });
  }

  Widget _buildBoxDecoration() {
    return Positioned(
      top: -_BoxDecoration.size.height * 0.4,
      left: -_BoxDecoration.size.width * 0.4,
      child: const _BoxDecoration(),
    );
  }

  Widget _buildDottedDecoration() {
    return Positioned(
      top: 4,
      right: 72,
      child: _DottedDecoration(animation: slideController),
    );
  }

  Widget _buildAppBarPokeballDecoration() {
    final screenSize = MediaQuery.sizeOf(context);
    final safeAreaTop = MediaQuery.paddingOf(context).top;

    final pokeSize = screenSize.width * 0.5;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = AppAppBar.padding.right;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeSize / 2 - iconButtonPadding - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedFade(
          animation: slideController,
          child: RotationTransition(
            turns: rotateController,
            child: Image(
              image: Assets.images.pokeball.provider(),
              width: pokeSize,
              height: pokeSize,
              color: Colors.white24,
            ),
          ),
        ),
      ),
    );
  }
}
