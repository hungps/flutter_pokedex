import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/core/utils.dart';
import 'package:pokedex/ui/screens/types/type_card.dart';
import 'package:pokedex/ui/screens/types/type_descrip.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_funcs.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_indices.dart';

class TypeFullList extends StatelessWidget {
  const TypeFullList({
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
                i: index,
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

class Redirection extends StatelessWidget {
  const Redirection({
    Key key,
    @required this.index,
    @required this.term,
    @required this.func,
  }) : super(key: key);

  final int index;
  final String term;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image(
                      image: AppImages.pokeball,
                      width: 30,
                      height: 30,
                      color: types[index].color.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${getEnumValue(types[index].type)[0].toUpperCase() + getEnumValue(types[index].type).substring(1)} Type " +
                            term),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
