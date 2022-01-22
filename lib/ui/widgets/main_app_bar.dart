import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/utils/size.dart';

const double mainAppbarPadding = 28;

class MainSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  MainSliverAppBar({
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + mainAppbarPadding * 2,
    double expandedFontSize = 30,
    void Function()? onLeadingPress = AppNavigator.pop,
    void Function()? onTrailingPress,
  }) : super(
          centerTitle: true,
          expandedHeight: height,
          floating: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: mainAppbarPadding),
            onPressed: onLeadingPress,
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: mainAppbarPadding),
              icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
              onPressed: onTrailingPress,
            ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final safeAreaTop = MediaQuery.of(context).padding.top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent = (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth = getTextSize(context, title, currentTextStyle).width;
              final startX = mainAppbarPadding;
              final endX = MediaQuery.of(context).size.width / 2 - textWidth / 2 - startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color: Colors.white.withOpacity(0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                        offset: Offset(dx, constraints.maxHeight - kToolbarHeight),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class MainAppBar extends AppBar {
  MainAppBar({Widget? title, IconData? rightIcon})
      : super(
          title: title,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: mainAppbarPadding),
            icon: Icon(Icons.arrow_back),
            onPressed: AppNavigator.pop,
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: mainAppbarPadding),
              child: Icon(rightIcon),
            ),
          ],
        );
}
