import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/core/utils.dart';
import 'package:pokedex/ui/screens/types/type_listview.dart';
import 'package:pokedex/ui/screens/types/type_sheet.dart';

Set<String> typeNames = {
  "normal",
  "fire",
  "water",
  "electric",
  "grass",
  "ice",
  "fighting",
  "poison",
  "ground",
  "flying",
  "psychic",
  "bug",
  "rock",
  "ghost",
  "dragon",
  "dark",
  "steel",
  "fairy"
};
List<String> normalTypeReturner(List<String> combined) {
  var allset = typeNames;
  for (var i = 0; i < combined.length; i++) {
    allset.remove(combined[i].toLowerCase());
  }
  return allset.toList();
}

Map<String, int> typeIndices = {
  "normal": 0,
  "fire": 1,
  "water": 2,
  "electric": 3,
  "grass": 4,
  "ice": 5,
  "fighting": 6,
  "poison": 7,
  "ground": 8,
  "flying": 9,
  "psychic": 10,
  "bug": 11,
  "rock": 12,
  "ghost": 13,
  "dragon": 14,
  "dark": 15,
  "steel": 16,
  "fairy": 17
};

class PokeTypes extends StatelessWidget {
  const PokeTypes({
    Key key,
    @required this.width,
    @required this.i,
  }) : super(key: key);

  final double width;
  final int i;

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
            i: i,
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
        margin: EdgeInsets.only(left: 10, right: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: AppColors.black.withAlpha(100)),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 25.0, // soften the shadow
              spreadRadius: 7.0, //extend the shadow
              offset: Offset(
                15.0, // Move to right 10  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          color: col,
        ),
        child: BoldText(text: text));
  }
}

class BoldText extends StatelessWidget {
  const BoldText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteGrey, shadows: [
        Shadow(
            // bottomLeft
            offset: Offset(-1, -1),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1, -1),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1, 1),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1, 1),
            color: Colors.black),
      ]),
      textAlign: TextAlign.center,
    );
  }
}

class TypeEffectCard extends StatelessWidget {
  const TypeEffectCard({
    Key key,
    @required this.width,
    @required this.i,
  }) : super(key: key);

  final double width;
  final int i;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: types[i].color,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          print(types[i]);
          showModalBottomSheet(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              context: context,
              builder: (b) {
                return TypeEffectSheet(w: width, i: i);
              });
        },
        child: PokeTypes(width: width, i: i),
      ),
    );
  }
}
