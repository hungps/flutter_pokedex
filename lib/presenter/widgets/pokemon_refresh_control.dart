import 'package:flutter/cupertino.dart';
import 'package:pokedex/presenter/widgets/loading.dart';

class SliverPokemonRefreshControl extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const SliverPokemonRefreshControl({
    super.key,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => const PikaLoadingIndicator(),
    );
  }
}
