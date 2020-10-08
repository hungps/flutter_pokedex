import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';

List<Widget> _lister(int i, dynamic n, double w) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8),
      child: Text(
        "Attacks to the types below will not be very effective",
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
            for (int j = 0; j < types[i]["effects"]["$n"].length; j++)
              Image.asset(
                "assets/images/type_${types[i]["effects"]["$n"][j].toString().toUpperCase()}.png",
                width: 100,
              )
          ],
        )),
    Center(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 1,
        width: w / 1.7,
        color: Colors.black12,
      ),
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
            child: Image.asset(
              "assets/images/type_${types[i]["name"].toString().toUpperCase()}.png",
              width: 200,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 1,
            width: w / 1.7,
            color: Colors.black12,
          ),
        ),
        if (types[i]["effects"]["2"].length > 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _lister(i, 2, w),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _lister(i, 0.5, w),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _lister(i, 1, w),
        ),
        if (types[i]["effects"]["0"].length > 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _lister(i, 0, w),
          ),
      ],
    );
  }
}
