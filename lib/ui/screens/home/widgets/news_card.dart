import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

class NewsCard extends StatelessWidget {
  final ImageProvider thumbnail;
  final String time;
  final String title;

  const NewsCard({super.key, 
    required this.title,
    required this.time,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: _buildContent(context)),
          const SizedBox(width: 36),
          Image(image: thumbnail, width: 110, height: 66),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          time,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
