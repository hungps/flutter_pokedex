import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';

class PokeBackgroundProperties {
  static const double _sizeFraction = 0.66;
  static const double _topFraction = 0.154;
  static const double _rightFraction = 0.23;

  final double size;
  final double top;
  final double right;

  const PokeBackgroundProperties._({this.size, this.top, this.right});

  factory PokeBackgroundProperties(Size screenSize) {
    final size = screenSize.width * _sizeFraction;
    final top = -screenSize.width * _topFraction;
    final right = -screenSize.width * _rightFraction;

    return PokeBackgroundProperties._(size: size, top: top, right: right);
  }
}

class PokeballBackground extends StatelessWidget {
  final List<Widget> Function(PokeBackgroundProperties) buildChildren;

  const PokeballBackground({Key key, this.buildChildren}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final properties = PokeBackgroundProperties(screenSize);

    return Stack(
      children: <Widget>[
        Positioned(
          top: properties.top,
          right: properties.right,
          child: Image(
            image: AppImages.pokeball,
            width: properties.size,
            height: properties.size,
            color: AppColors.black.withOpacity(0.05),
          ),
        ),
        ...buildChildren(properties),
      ],
    );
  }
}

// class PokeContainer extends StatelessWidget {
//   const PokeContainer({
//     Key key,
//     @required this.children,
//     this.height,
//     this.decoration,
//     this.appBar = false,
//   }) : super(key: key);

//   final bool appBar;
//   final List<Widget> children;
//   final Decoration decoration;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     final pokeSize = screenSize.width * 0.66;
//     final pokeTop = -(screenSize.width * 0.154);
//     final pokeRight = -(screenSize.width * 0.23);
//     final appBarTop = pokeSize / 2 + pokeTop - IconTheme.of(context).size / 2;

//     return Container(
//       width: screenSize.width,
//       decoration: decoration,
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: pokeTop,
//             right: pokeRight,
//             child: Image(
//               image: AppImages.pokeball,
//               width: pokeSize,
//               height: pokeSize,
//               color: AppColors.black.withOpacity(0.05),
//             ),
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               if (appBar)
//                 Padding(
//                   padding: EdgeInsets.only(left: 26, right: 26, top: appBarTop),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       InkWell(
//                         child: Icon(Icons.arrow_back),
//                         onTap: AppNavigator.pop,
//                       ),
//                       Icon(Icons.menu),
//                     ],
//                   ),
//                 ),
//               if (children != null) ...children,
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
