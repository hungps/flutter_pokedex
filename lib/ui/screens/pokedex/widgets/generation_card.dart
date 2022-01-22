import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/generation.dart';
import 'package:pokedex/core/extensions/context.dart';

class GenerationCard extends StatelessWidget {
  const GenerationCard(this.generation);

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
              offset: Offset(0, context.responsive(8)),
              blurRadius: 15,
              color: AppColors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: context.responsive(16),
              ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: generation.pokemons
                        .map(
                          (pokemon) => Expanded(
                            child: Image.asset(
                              pokemon,
                              fit: BoxFit.contain,
                              width: height * 0.41,
                              height: height * 0.41,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -height * 0.136,
              right: -height * 0.03,
              child: Image(
                image: AppImages.pokeball,
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
