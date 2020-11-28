import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/core/extensions/context.dart';

class PokeNews extends StatelessWidget {
  const PokeNews({
    @required this.title,
    @required this.time,
    @required this.thumbnail,
  });

  final ImageProvider thumbnail;
  final String time;
  final String title;

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.responsive(6)),
        Text(
          time,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 28,
        vertical: context.responsive(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: _buildContent(context),
          ),
          SizedBox(width: 36),
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1.6,
              child: Image(image: thumbnail),
            ),
          ),
        ],
      ),
    );
  }
}
