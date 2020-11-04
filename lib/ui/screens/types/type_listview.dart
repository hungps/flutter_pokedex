import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/type_card.dart';

List<String> effectreturner(int i, dynamic n) {
  if (n == 0) {
    return types[i].nilEffective;
  } else if (n == 1) {
    return normalTypeReturner(
        types[i].nilEffective + types[i].superEffective + types[i].notEffective);
  } else if (n == 0.5) {
    return types[i].notEffective;
  } else {
    return types[i].superEffective;
  }
}

List<Widget> _lister(int i, dynamic n, double w, String term) {
  var arr = effectreturner(i, n);
  return [
    Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Attacks to the types below will " + term,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
    Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        width: w * 0.75,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            for (int j = 0; j < arr.length; j++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TypeDisplayContainer(
                  i: i,
                  path: "effects",
                  value: n,
                  width: 100.0,
                  j: j,
                  height: 30,
                  typeList: arr,
                ),
              )
          ],
        )),
    Container(
      margin: EdgeInsets.only(top: 20),
      height: 1,
      width: w / 1.7,
      color: Colors.black12,
    ),
  ];
}

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
            children: _lister(i, 2, w, "be super effective"),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _lister(i, 0.5, w, "be not very effective"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _lister(i, 1, w, "be normal"),
        ),
        if (types[i].nilEffective.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _lister(i, 0, w, "have no effect"),
          ),
      ],
    );
  }
}
