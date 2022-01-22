import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

class FabItem {
  const FabItem(this.title, this.icon, {this.onPress});

  final IconData icon;
  final void Function()? onPress;
  final String title;
}

class FabMenuItem extends StatelessWidget {
  const FabMenuItem(this.item, {Key? key}) : super(key: key);

  final FabItem item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: StadiumBorder(),
      padding: EdgeInsets.only(
        left: 24,
        right: 16,
        top: context.responsive(8),
        bottom: context.responsive(8),
      ),
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
          HSpacer(8),
          Icon(item.icon, color: AppColors.indigo),
        ],
      ),
    );
  }
}

class ExpandedAnimationFab extends AnimatedWidget {
  const ExpandedAnimationFab({
    required this.items,
    required Animation animation,
    this.onPress,
  }) : super(listenable: animation);

  final List<FabItem> items;
  final void Function()? onPress;

  Animation<double> get animation => listenable as Animation<double>;

  Widget _buildItem(BuildContext context, int index) {
    final screenWidth = context.screenSize.width;

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
          ignoring: animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: context.responsive(9)),
            padding: EdgeInsets.symmetric(vertical: context.responsive(12)),
            itemCount: items.length,
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
}
