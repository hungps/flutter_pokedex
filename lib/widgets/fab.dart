import 'package:flutter/material.dart';

import '../configs/AppColors.dart';

class FabItem {
  const FabItem(this.title, this.icon, {this.onPress});

  final IconData icon;
  final Function onPress;
  final String title;
}

class FabMenuItem extends StatelessWidget {
  const FabMenuItem(this.item, {Key key}) : super(key: key);

  final FabItem item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: StadiumBorder(),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 24, right: 16),
      color: Colors.white,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 0,
      highlightElevation: 2,
      disabledColor: Colors.white,
      onPressed: item.onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(item.title),
          SizedBox(width: 8),
          Icon(item.icon, color: AppColors.indigo),
        ],
      ),
    );
  }
}

class ExpandedAnimationFab extends AnimatedWidget {
  const ExpandedAnimationFab({
    @required this.items,
    this.onPress,
    Animation animation,
  }) : super(listenable: animation);

  final List<FabItem> items;
  final Function onPress;

  get _animation => listenable;

  Widget buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    final transform = Matrix4.translationValues(
      -(screenWidth - _animation.value * screenWidth) * ((items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: Alignment.centerRight,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: _animation.value,
          child: FabMenuItem(items[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: _animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: 9),
            padding: EdgeInsets.symmetric(vertical: 12),
            itemCount: items.length,
            itemBuilder: buildItem,
          ),
        ),
        FloatingActionButton(
          backgroundColor: AppColors.indigo,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animation,
          ),
          onPressed: onPress,
        ),
      ],
    );
  }
}
