import 'package:flutter/material.dart';
import 'package:pokedex/data/types.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/themes/colors.dart';
import 'package:pokedex/utils/extensions/string.dart';

// Class responsible for creating the cards that redirects to other pages in the list view

class Redirection extends StatelessWidget {
  const Redirection({
    super.key,
    required this.index,
    required this.term,
    required this.func,
  });

  final int index;
  final String term;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: func,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image(
                      image: Assets.images.pokeball.provider(),
                      width: 30,
                      height: 30,
                      color: types[index].color.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${types[index].type.displayName.capitalize()} Type $term"),
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
