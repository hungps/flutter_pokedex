import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pages/types/type_container.dart';
// A class that is responsible for the pokeball kind of grids that contain types

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    required this.width,
    required this.index,
  });

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.black87, width: 2.5)),
          ),
        ),
        Align(
            child: Container(
          height: 5,
          color: Colors.white,
        )),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width / 7,
            decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black87, width: 2.5)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: TypeDisplayContainer(
            index: index,
            path: "name",
            value: null,
            width: null,
            j: null,
            height: 30,
            typeList: const [],
          ),
        ),
      ],
    );
  }
}
