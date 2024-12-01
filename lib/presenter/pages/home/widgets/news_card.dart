import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class HomeNewsListTile extends StatelessWidget {
  final ImageProvider thumbnail;
  final String title;
  final DateTime postedAt;
  final String _postedAtDateFormat;

  const HomeNewsListTile({
    super.key,
    required this.title,
    required this.postedAt,
    required this.thumbnail,
  }) : _postedAtDateFormat = "dd MMM yyyy";

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
                DateFormat(_postedAtDateFormat).format(postedAt),
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
