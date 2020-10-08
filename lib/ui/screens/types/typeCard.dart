import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/typeSheet.dart';

class PokeTypes extends StatelessWidget {
  const PokeTypes({
    Key key,
    @required this.w,
    @required this.i,
  }) : super(key: key);

  final double w;
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
            width: w / 7,
            decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black87, width: 2.5)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/type_${types[i]["name"].toString().toUpperCase()}.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

class TypeCard extends StatelessWidget {
  const TypeCard({
    Key key,
    @required this.w,
    @required this.i,
  }) : super(key: key);

  final double w;
  final int i;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: types[i]["color"],
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          showModalBottomSheet(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              context: context,
              builder: (b) {
                return TypeSheet(w: w, i: i);
              });
        },
        child: PokeTypes(w: w, i: i),
      ),
    );
  }
}
