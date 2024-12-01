import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presenter/assets.gen.dart';

class PokemonImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final String url;
  final EdgeInsets padding;
  final bool useHero;
  final Size? size;
  final ImageProvider? placeholder;
  final Color? tintColor;

  const PokemonImage({
    super.key,
    required this.url,
    this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: url,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: url,
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: const Duration(milliseconds: 120),
            fadeOutDuration: const Duration(milliseconds: 120),
            fit: BoxFit.contain,
            imageBuilder: (_, image) => Image(
              image: image,
              width: size?.width,
              height: size?.height,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            placeholder: (_, __) => Image(
              image: placeholder ?? Assets.images.bulbasaur.provider(),
              width: size?.width,
              height: size?.height,
              color: Colors.black12,
              fit: BoxFit.contain,
            ),
            errorWidget: (_, __, ___) => Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: placeholder ?? Assets.images.bulbasaur.provider(),
                  width: size?.width,
                  height: size?.height,
                  color: Colors.black12,
                  fit: BoxFit.contain,
                ),
                const FractionallySizedBox(
                  widthFactor: 0.3,
                  child: Icon(
                    Icons.warning_amber_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
