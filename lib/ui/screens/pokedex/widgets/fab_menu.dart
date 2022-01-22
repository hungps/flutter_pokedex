part of '../pokedex.dart';

class _FabMenu extends StatelessWidget {
  const _FabMenu({
    required this.animation,
    required this.toggle,
    this.onFavouritePress,
    this.onAllTypePress,
    this.onAllGenPress,
    this.onSearchPress,
  });

  final Animation animation;
  final void Function()? onAllGenPress;
  final void Function()? onAllTypePress;
  final void Function()? onFavouritePress;
  final void Function()? onSearchPress;
  final void Function()? toggle;

  void onPress(Function? callback) {
    toggle?.call();
    callback?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedAnimationFab(
      animation: animation,
      onPress: toggle,
      items: [
        FabItem(
          'Favourite Pokemon',
          Icons.favorite,
          onPress: () => onPress(onFavouritePress),
        ),
        FabItem(
          'All Type',
          Icons.filter_vintage,
          onPress: () => onPress(onAllTypePress),
        ),
        FabItem(
          'All Gen',
          Icons.flash_on,
          onPress: () => onPress(onAllGenPress),
        ),
        FabItem(
          'Search',
          Icons.search,
          onPress: () => onPress(onSearchPress),
        ),
      ],
    );
  }
}
