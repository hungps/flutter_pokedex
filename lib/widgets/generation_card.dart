import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../configs/AppColors.dart';
import '../models/generation.dart';

class GenerationCard extends StatelessWidget {
  const GenerationCard(this.generation, {Key key}) : super(key: key);

  final Generation generation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 15,
              color: AppColors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(16),
              // color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    generation.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: generation.pokemons
                        .map((pokemon) => Image.asset(
                              pokemon,
                              fit: BoxFit.contain,
                              width: height * 0.41,
                              height: height * 0.41,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -height * 0.136,
              right: -height * 0.03,
              child: Image.asset(
                "assets/images/pokeball.png",
                width: height * 0.754,
                height: height * 0.754,
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ],
        ),
      );
    });
  }
}
