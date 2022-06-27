import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

class FabItemData {
  final IconData icon;
  final void Function()? onPress;
  final String title;

  const FabItemData(this.title, this.icon, {this.onPress});
}

class FabItem extends StatelessWidget {
  final FabItemData item;

  const FabItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bgColor = Theme.of(context).backgroundColor;
    return MaterialButton(
      shape: StadiumBorder(),
      padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
      color: bgColor,
      splashColor: Colors.grey[100],
      highlightColor: Colors.grey[100],
      elevation: 0,
      highlightElevation: 2,
      disabledColor: bgColor,
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
  final List<FabItemData> items;
  final void Function()? onPress;

  const ExpandedAnimationFab({
    required this.items,
    required Animation animation,
    this.onPress,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 12),
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(height: 9),
            itemBuilder: _buildItem,
          ),
        ),
        FloatingActionButton(
          backgroundColor: AppColors.indigo,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animation,
          ),
          onPressed: onPress,
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    final transform = Matrix4.translationValues(
      -(screenWidth - animation.value * screenWidth) * ((items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: Alignment.centerRight,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: animation.value,
          child: FabItem(items[index]),
        ),
      ),
    );
  }
}
