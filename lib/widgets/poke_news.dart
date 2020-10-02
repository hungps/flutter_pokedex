import 'package:flutter/material.dart';

import '../configs/AppColors.dart';

// A Widget Created To Be Used To Display Pokemon News in the Home Page
class PokeNews extends StatelessWidget {
  const PokeNews({
    Key key,
    @required this.title,
    @required this.time,
    @required this.thumbnail,
  }) : super(key: key);

  final Image thumbnail;
  final String time;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 36),
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1.6,
              child: thumbnail,
            ),
          ),
        ],
      ),
    );
  }
}
