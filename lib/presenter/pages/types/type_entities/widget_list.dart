import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pages/types/type_container.dart';
import 'package:pokedex/presenter/pages/types/type_entities/type_funcs.dart';

// A function that return a list of widgets that are used in displaying the effectiveness
List<Widget> lister(int index, dynamic value, double width, String term) {
  var arr = effectreturner(index, value);
  return [
    Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          term,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            // color: Colors.black54,
          ),
        ),
      ),
    ),
    Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        width: width * 0.75,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            for (int j = 0; j < arr.length; j++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TypeDisplayContainer(
                  index: index,
                  path: "effects",
                  value: value,
                  width: 75.0,
                  j: j,
                  height: 25,
                  typeList: arr,
                ),
              )
          ],
        )),
    Container(
      margin: const EdgeInsets.only(top: 20),
      height: 1,
      width: width / 1.7,
      color: Colors.black12,
    ),
  ];
}
