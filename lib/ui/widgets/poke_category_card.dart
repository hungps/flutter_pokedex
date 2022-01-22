import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/core/extensions/context.dart';

class PokeCategoryCard extends StatelessWidget {
  const PokeCategoryCard(
    this.category, {
    this.onPress,
  });

  final Category category;
  final void Function()? onPress;

  Widget _buildCircleDecoration({required double height}) {
    return Positioned(
      top: -height * 0.616,
      left: -height * 0.53,
      child: CircleAvatar(
        radius: (height * 1.03) / 2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildPokemonDecoration({required double height}) {
    return Positioned(
      top: -height * 0.16,
      right: -height * 0.25,
      child: Image(
        image: AppImages.pokeball,
        width: height * 1.388,
        height: height * 1.388,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;
        final itemWidth = constrains.maxWidth;

        return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: _Shadows(color: category.color, width: itemWidth * 0.82),
            ),
            Material(
              color: category.color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                onTap: onPress,
                child: Stack(
                  children: [
                    _buildPokemonDecoration(height: itemHeight),
                    _buildCircleDecoration(height: itemHeight),
                    _CardContent(category.name),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _Shadows extends StatelessWidget {
  const _Shadows({required this.color, required this.width});

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.82,
      height: context.responsive(11),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(0, context.responsive(3)),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}
