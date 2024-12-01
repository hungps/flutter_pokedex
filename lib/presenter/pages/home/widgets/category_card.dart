import 'package:flutter/material.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class HomeCategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const HomeCategoryCard({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final height = constraints.maxHeight;

      return Stack(
        children: [
          if (onPressed != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: _CardShadow(color: color),
            ),
          FilledButton(
            onPressed: onPressed,
            clipBehavior: Clip.hardEdge,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: color,
              foregroundColor: context.colors.textOnPrimary,
              disabledBackgroundColor: context.colors.disabled,
              disabledForegroundColor: context.colors.textOnPrimary,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: _CircleDecorator(size: height),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _PokeballDecorator(size: height),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    style: context.typographies.body.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _CardShadow extends StatelessWidget {
  final Color color;

  const _CardShadow({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, 6),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}

class _CircleDecorator extends StatelessWidget {
  final double size;

  const _CircleDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-size * 0.5, -size * 0.6),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: context.colors.background.withOpacity(0.14),
      ),
    );
  }
}

class _PokeballDecorator extends StatelessWidget {
  final double size;

  const _PokeballDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Image(
        image: Assets.images.pokeball.provider(),
        width: size,
        height: size,
        color: context.colors.background.withOpacity(0.14),
        fit: BoxFit.contain,
      ),
    );
  }
}
