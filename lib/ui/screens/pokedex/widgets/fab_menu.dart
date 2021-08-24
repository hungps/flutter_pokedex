// part of '../pokedex.dart';

// class _FabMenu extends StatelessWidget {
//   const _FabMenu({
//     required this.animation,
//     required this.toggle,
//     required this.onAllGenPress,
//     required this.onSearchPress,
//   });

//   final Animation animation;
//   final Function onAllGenPress;
//   // final Function onAllTypePress;
//   // final Function onFavouritePress;
//   final Function onSearchPress;
//   final Function toggle;

//   void onPress(Function callback) {
//     toggle();

//     if (callback != null) callback();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ExpandedAnimationFab(
//       animation: animation as Animation<double>,
//       onPress: toggle,
//       items: [
//         FabItem(
//           'Favourite Pokemon',
//           Icons.favorite,
//           // onPress: () => onPress(onFavouritePress),
//         ),
//         FabItem(
//           'All Type',
//           Icons.filter_vintage,
//           // onPress: () => onPress(onAllTypePress),
//         ),
//         FabItem(
//           'All Gen',
//           Icons.flash_on,
//           onPress: () => onPress(onAllGenPress),
//         ),
//         FabItem(
//           'Search',
//           Icons.search,
//           onPress: () => onPress(onSearchPress),
//         ),
//       ],
//     );
//   }
// }
