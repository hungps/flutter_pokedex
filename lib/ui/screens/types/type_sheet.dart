import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/ui/screens/types/type_listview.dart';

class TypeEffectSheet extends StatelessWidget {
  const TypeEffectSheet({
    Key key,
    @required this.w,
    @required this.i,
  }) : super(key: key);

  final double w;
  final int i;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        builder: (b, s) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Stack(
              children: [
                Positioned(
                  top: -w / 10,
                  left: -w / 6,
                  child: Image(
                    image: AppImages.pokeball,
                    width: w / 2,
                    height: w / 2,
                    color: AppColors.black.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: -w / 10,
                  right: -w / 6,
                  child: Image(
                    image: AppImages.pokeball,
                    width: w / 2,
                    height: w / 2,
                    color: AppColors.black.withOpacity(0.1),
                  ),
                ),
                TypeFullList(i: i, w: w, s: s),
              ],
            ),
          );
        });
  }
}
