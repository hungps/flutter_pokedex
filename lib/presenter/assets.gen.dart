/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFilesGen {
  const $AssetsFilesGen();

  /// File path: assets/files/abilites.json
  String get abilites => 'assets/files/abilites.json';

  /// File path: assets/files/items.json
  String get items => 'assets/files/items.json';

  /// File path: assets/files/moves.json
  String get moves => 'assets/files/moves.json';

  /// File path: assets/files/pokemons.json
  String get pokemons => 'assets/files/pokemons.json';

  /// List of all assets
  List<String> get values => [abilites, items, moves, pokemons];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bulbasaur.png
  AssetGenImage get bulbasaur => const AssetGenImage('assets/images/bulbasaur.png');

  /// File path: assets/images/charmander.png
  AssetGenImage get charmander => const AssetGenImage('assets/images/charmander.png');

  /// File path: assets/images/chespin.png
  AssetGenImage get chespin => const AssetGenImage('assets/images/chespin.png');

  /// File path: assets/images/chikorita.png
  AssetGenImage get chikorita => const AssetGenImage('assets/images/chikorita.png');

  /// File path: assets/images/chimchar.png
  AssetGenImage get chimchar => const AssetGenImage('assets/images/chimchar.png');

  /// File path: assets/images/cyndaquil.png
  AssetGenImage get cyndaquil => const AssetGenImage('assets/images/cyndaquil.png');

  /// File path: assets/images/dotted.png
  AssetGenImage get dotted => const AssetGenImage('assets/images/dotted.png');

  /// File path: assets/images/female.png
  AssetGenImage get female => const AssetGenImage('assets/images/female.png');

  /// File path: assets/images/fennekin.png
  AssetGenImage get fennekin => const AssetGenImage('assets/images/fennekin.png');

  /// File path: assets/images/froakie.png
  AssetGenImage get froakie => const AssetGenImage('assets/images/froakie.png');

  /// File path: assets/images/grookey.png
  AssetGenImage get grookey => const AssetGenImage('assets/images/grookey.png');

  /// File path: assets/images/litten.png
  AssetGenImage get litten => const AssetGenImage('assets/images/litten.png');

  /// File path: assets/images/male.png
  AssetGenImage get male => const AssetGenImage('assets/images/male.png');

  /// File path: assets/images/mudkip.png
  AssetGenImage get mudkip => const AssetGenImage('assets/images/mudkip.png');

  /// File path: assets/images/oshawott.png
  AssetGenImage get oshawott => const AssetGenImage('assets/images/oshawott.png');

  /// File path: assets/images/pika_loader.gif
  AssetGenImage get pikaLoader => const AssetGenImage('assets/images/pika_loader.gif');

  /// File path: assets/images/piplup.png
  AssetGenImage get piplup => const AssetGenImage('assets/images/piplup.png');

  /// File path: assets/images/pokeball.png
  AssetGenImage get pokeball => const AssetGenImage('assets/images/pokeball.png');

  /// File path: assets/images/popplio.png
  AssetGenImage get popplio => const AssetGenImage('assets/images/popplio.png');

  /// File path: assets/images/rowlet.png
  AssetGenImage get rowlet => const AssetGenImage('assets/images/rowlet.png');

  /// File path: assets/images/scorbunny.png
  AssetGenImage get scorbunny => const AssetGenImage('assets/images/scorbunny.png');

  /// File path: assets/images/snivy.png
  AssetGenImage get snivy => const AssetGenImage('assets/images/snivy.png');

  /// File path: assets/images/sobble.png
  AssetGenImage get sobble => const AssetGenImage('assets/images/sobble.png');

  /// File path: assets/images/squirtle.png
  AssetGenImage get squirtle => const AssetGenImage('assets/images/squirtle.png');

  /// File path: assets/images/tepig.png
  AssetGenImage get tepig => const AssetGenImage('assets/images/tepig.png');

  /// File path: assets/images/thumbnail.png
  AssetGenImage get thumbnail => const AssetGenImage('assets/images/thumbnail.png');

  /// File path: assets/images/torchic.png
  AssetGenImage get torchic => const AssetGenImage('assets/images/torchic.png');

  /// File path: assets/images/totodile.png
  AssetGenImage get totodile => const AssetGenImage('assets/images/totodile.png');

  /// File path: assets/images/treecko.png
  AssetGenImage get treecko => const AssetGenImage('assets/images/treecko.png');

  /// File path: assets/images/turtwig.png
  AssetGenImage get turtwig => const AssetGenImage('assets/images/turtwig.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bulbasaur,
        charmander,
        chespin,
        chikorita,
        chimchar,
        cyndaquil,
        dotted,
        female,
        fennekin,
        froakie,
        grookey,
        litten,
        male,
        mudkip,
        oshawott,
        pikaLoader,
        piplup,
        pokeball,
        popplio,
        rowlet,
        scorbunny,
        snivy,
        sobble,
        squirtle,
        tepig,
        thumbnail,
        torchic,
        totodile,
        treecko,
        turtwig
      ];
}

class Assets {
  Assets._();

  static const $AssetsFilesGen files = $AssetsFilesGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
