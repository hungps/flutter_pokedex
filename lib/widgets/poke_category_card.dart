import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/category.dart';

class PokeCategoryCard extends StatelessWidget {
  const PokeCategoryCard(
    this.category, {
    Key key,
    this.onPress,
  }) : super(key: key);

  final Category category;
  final Function onPress;

  Widget _buildCardContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          category.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDecorations(double itemHeight) {
    return [
      Positioned(
        top: -itemHeight * 0.616,
        left: -itemHeight * 0.53,
        child: CircleAvatar(
          radius: itemHeight * 1.03 / 2,
          backgroundColor: Colors.white.withOpacity(0.14),
        ),
      ),
      Positioned(
        top: -itemHeight * 0.16,
        right: -itemHeight * 0.25,
        child: Image.asset(
          "assets/images/pokeball.png",
          width: itemHeight * 1.388,
          height: itemHeight * 1.388,
          color: Colors.white.withOpacity(0.14),
        ),
      ),
    ];
  }

  Widget _buildShadow(double itemWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: itemWidth * 0.82,
        height: 11,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: category.color,
              offset: Offset(0, 3),
              blurRadius: 23,
            ),
          ],
        ),
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
            _buildShadow(itemWidth),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(0),
              color: category.color,
              splashColor: Colors.white10,
              highlightColor: Colors.white10,
              elevation: 0,
              highlightElevation: 2,
              disabledColor: category.color,
              onPressed: onPress,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    _buildCardContent(),
                    ..._buildDecorations(itemHeight),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
