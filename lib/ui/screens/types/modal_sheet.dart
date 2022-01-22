import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/types/modal_draggable.dart';
import 'package:pokedex/configs/types.dart';
import 'colored_pokeball.dart';

// Class that is responsible for making the modal sheet appear when a type is clicked on

class ModalSheet extends StatelessWidget {
  const ModalSheet({
    Key? key,
    required this.width,
    required this.index,
  }) : super(key: key);

  final double width;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: types[index].color,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              context: context,
              builder: (b) {
                return ModalDraggable(width: width, index: index);
              });
        },
        child: CircularContainer(width: width, index: index),
      ),
    );
  }
}
