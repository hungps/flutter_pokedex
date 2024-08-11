import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class HomeNewsListTile extends StatelessWidget {
  final ImageProvider thumbnail;
  final String title;
  final String time;

  const HomeNewsListTile({
    super.key,
    required this.title,
    required this.time,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: context.typographies.body.withWeight(FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                time,
                style:
                    context.typographies.caption.withColor(context.colors.hint),
              ),
            ],
          ),
        ),
        const SizedBox(width: 36),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: thumbnail,
            width: 110,
            height: 66,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
