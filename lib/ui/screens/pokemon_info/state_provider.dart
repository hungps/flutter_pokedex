import 'package:flutter/material.dart';

class PokemonInfoStateProvider extends InheritedWidget {
  final AnimationController slideController;
  final AnimationController rotateController;

  const PokemonInfoStateProvider({
    Key? key,
    required this.slideController,
    required this.rotateController,
    required Widget child,
  }) : super(child: child);

  static PokemonInfoStateProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<PokemonInfoStateProvider>();

    return result!;
  }

  @override
  bool updateShouldNotify(covariant PokemonInfoStateProvider oldWidget) => false;
}
