import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/core/utils.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_indices.dart';
import 'package:pokedex/ui/screens/types/type_listview.dart';
import 'package:pokedex/ui/screens/types/type_sheet.dart';

import 'bold_texts.dart';

class PokeTypes extends StatelessWidget {
  const PokeTypes({
    Key key,
    @required this.width,
    @required this.index,
  }) : super(key: key);

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
            i: index,
            path: "name",
            value: null,
            width: null,
            j: null,
            height: 30,
            typeList: [],
          ),
        ),
      ],
    );
  }
}

class TypeDisplayContainer extends StatelessWidget {
  const TypeDisplayContainer(
      {Key key,
      @required this.i,
      @required this.path,
      @required this.value,
      @required this.width,
      @required this.height,
      @required this.typeList,
      @required this.j})
      : super(key: key);

  final int i;
  final int j;
  final String path;
  final List<String> typeList;
  final dynamic value;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    Color col;
    String text;
    void assigner() {
      if (path == "name") {
        col = types[i].color;
        text = getEnumValue(types[i].type).toUpperCase();
      } else {
        col = types[typeIndices[typeList[j].toLowerCase()]].color;
        text = getEnumValue(types[typeIndices[typeList[j].toLowerCase()]].type).toUpperCase();
      }
    }

    assigner();
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5, right: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: AppColors.black.withAlpha(100)),
          boxShadow: [
            (width != 75)
                ? BoxShadow(
                    color: AppColors.grey,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 7.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                : BoxShadow()
          ],
          color: col,
        ),
        child: BoldText(text: text));
  }
}

class TypeEffectCard extends StatelessWidget {
  const TypeEffectCard({
    Key key,
    @required this.width,
    @required this.index,
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
          print(types[index]);
          showModalBottomSheet(
              isScrollControlled: true,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              context: context,
              builder: (b) {
                return TypeEffectSheet(width: width, index: index);
              });
        },
        child: PokeTypes(width: width, index: index),
      ),
    );
  }
}
