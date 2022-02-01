import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function()? onPress;

  const CategoryCard(
    this.category, {
    this.onPress,
  });

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
                    _buildPokeballDecoration(height: itemHeight),
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

  Widget _buildPokeballDecoration({required double height}) {
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
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
      height: 11,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(0, 3),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}
