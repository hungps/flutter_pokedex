import 'package:flutter/cupertino.dart';
import 'package:pokedex/configs/images.dart';

class PokemonRefreshControl extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const PokemonRefreshControl({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => Image(
        image: AppImages.pikloader,
      ),
    );
  }
}
