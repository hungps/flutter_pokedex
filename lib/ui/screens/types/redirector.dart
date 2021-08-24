import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/utils.dart';
import 'package:pokedex/configs/types.dart';

// Class responsible for creating the cards that redirects to other pages in the list view

class Redirection extends StatelessWidget {
  const Redirection({
    Key? key,
    required this.index,
    required this.term,
    required this.func,
  }) : super(key: key);

  final int index;
  final String term;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: func,
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
