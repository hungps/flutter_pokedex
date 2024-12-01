import 'package:flutter/material.dart';
import 'package:pokedex/presenter/assets.gen.dart';

class PokeballDecorator extends StatelessWidget {
  final double size;
  final double pokeballSize;
  final Color pokeballColor;
  final Widget child;
  final bool animated;

  const PokeballDecorator({
    super.key,
    required this.size,
    required this.pokeballSize,
    required this.pokeballColor,
    required this.child,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        SizedBox.square(
          dimension: size,
          child: OverflowBox(
            maxWidth: pokeballSize,
            maxHeight: pokeballSize,
            child: animated
                ? RotatingPokeballImage(
                    color: pokeballColor,
                    size: pokeballSize,
                  )
                : PokeballImage(
                    color: pokeballColor,
                    size: pokeballSize,
                  ),
          ),
        ),
        child,
      ],
    );
  }
}

class PokeballImage extends Image {
  PokeballImage({
    super.key,
    Color? color,
    double? size,
  }) : super.asset(
          Assets.images.pokeball.path,
          color: color,
          width: size,
          height: size,
        );
}

class RotatingPokeballImage extends StatefulWidget {
  final Color color;
  final double size;

  const RotatingPokeballImage({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  State<RotatingPokeballImage> createState() => _RotatingPokeballImageState();
}

class _RotatingPokeballImageState extends State<RotatingPokeballImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: PokeballImage(
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
