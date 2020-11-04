import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/type_card.dart';
import 'package:pokedex/ui/screens/types/type_descrip.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_funcs.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_indices.dart';

class TypeFullList extends StatelessWidget {
  const TypeFullList({
    Key key,
    @required this.i,
    @required this.w,
    @required this.s,
  }) : super(key: key);

  final int i;
  final double w;
  final ScrollController s;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      controller: s,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              alignment: Alignment.center,
              child: TypeDisplayContainer(
                i: i,
                path: "name",
                value: null,
                width: 200.0,
                j: null,
                height: 70,
                typeList: [],
              )),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 1,
            width: w / 1.7,
            color: Colors.black12,
          ),
        ),
        if (types[i].superEffective.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(i, 2, w, "be super effective"),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(i, 0.5, w, "be not very effective"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(i, 1, w, "be normal"),
        ),
        if (types[i].nilEffective.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(i, 0, w, "have no effect"),
          ),
      ],
    );
  }
}
