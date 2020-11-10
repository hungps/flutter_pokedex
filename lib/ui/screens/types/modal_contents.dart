import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/redirector.dart';
import 'package:pokedex/ui/screens/types/type_container.dart';
import 'package:pokedex/ui/screens/types/type_entities/widget_list.dart';

// Class responsible for creating the list present in the modal page consisting of various effects related to the selected type
class ModalContents extends StatelessWidget {
  const ModalContents({
    Key key,
    @required this.index,
    @required this.width,
    @required this.scroller,
  }) : super(key: key);

  final int index;
  final double width;
  final ScrollController scroller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      controller: scroller,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              alignment: Alignment.center,
              child: TypeDisplayContainer(
                index: index,
                path: "name",
                value: null,
                width: 200.0,
                j: null,
                height: 70,
                typeList: [],
              )), //type_card
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 1,
            width: width / 1.7,
            color: Colors.black12,
          ),
        ),
        if (types[index].superEffective.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(index, 2, width, "Effective Against".toUpperCase()),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(index, 0.5, width, "Weak Against".toUpperCase()),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(index, 1, width, "Normal Against".toUpperCase()),
        ),
        if (types[index].nilEffective.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(index, 0, width, "No Effect Against".toUpperCase()),
          ),
        Redirection(index: index, term: "Pokemons", func: () {}),
        Redirection(index: index, term: "Items", func: () {}),
        Redirection(index: index, term: "Moves", func: () {})
      ],
    );
  }
}
