import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const bulbasaur = _Image('bulbasaur.png');
  static const pikloader = _Image('pika_loader.gif');
  static const charmander = _Image('charmander.png');
  static const dotted = _Image('dotted.png');
  static const female = _Image('female.png');
  static const male = _Image('male.png');
  static const pokeball = _Image('pokeball.png');
  static const squirtle = _Image('squirtle.png');
  static const thumbnail = _Image('thumbnail.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(dotted, context);
    await precacheImage(female, context);
    await precacheImage(male, context);
    await precacheImage(pokeball, context);
    await precacheImage(thumbnail, context);
    await precacheImage(bulbasaur, context);
    await precacheImage(charmander, context);
    await precacheImage(squirtle, context);
  }
}
