import 'package:flutter/material.dart';
import 'package:pokedex/presenter/assets.gen.dart';

class PikaLoadingIndicator extends StatelessWidget {
  const PikaLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: Assets.images.pikaLoader.provider(),
        fit: BoxFit.contain,
      ),
    );
  }
}
