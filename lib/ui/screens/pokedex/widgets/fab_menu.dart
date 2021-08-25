part of '../pokedex.dart';

// ignore: must_be_immutable
class _FabMenu extends StatelessWidget {
  _FabMenu(
      {required this.animation,
      // required this.toggle,
      required this.onAllGenPress,
      required this.onSearchPress,
      this.fabController,
      required this.isFabMenuVisible});

  final Animation animation;
  final AnimationController? fabController;
  bool isFabMenuVisible;
  final Function onAllGenPress;
  // final Function onAllTypePress;
  // final Function onFavouritePress
  final Function onSearchPress;
  // final Function toggle;

  void _toggleFabMenu() {
    isFabMenuVisible = !isFabMenuVisible;

    if (isFabMenuVisible) {
      fabController!.forward();
    } else {
      fabController!.reverse();
    }
    return;
  }

  void onPress(Function? callback) {
    _toggleFabMenu();

    if (callback != null) callback();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedAnimationFab(
      animation: animation as Animation<double>,
      onPress: () {
        _toggleFabMenu();
      },
      items: [
        FabItem('Favourite Pokemon', Icons.favorite, onPress: () {
          _toggleFabMenu();
        }),
        FabItem(
          'All Type',
          Icons.filter_vintage,
          onPress: () {
            _toggleFabMenu();
            // onAllTypePress();
          },
        ),
        FabItem(
          'All Gen',
          Icons.flash_on,
          onPress: () {
            _toggleFabMenu();
            onAllGenPress();
          },
        ),
        FabItem(
          'Search',
          Icons.search,
          onPress: () {
            _toggleFabMenu();
            onSearchPress();
          },
        ),
      ],
    );
  }
}
