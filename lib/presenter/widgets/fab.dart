import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/animated_overlay.dart';
import 'package:pokedex/utils/extensions/animation.dart';

class ExpandableFabMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  const ExpandableFabMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.fromLTRB(18, 8, 14, 8),
        backgroundColor: context.colors.background,
        foregroundColor: context.colors.text,
        disabledForegroundColor: context.colors.text,
        disabledBackgroundColor: context.colors.disabled,
        disabledIconColor: context.colors.hint,
        iconColor: context.colors.secondary,
        elevation: 2,
      ),
      label: Text(title),
      icon: Icon(icon),
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
    );
  }
}

class ExpandableFab extends StatefulWidget {
  final AnimatedIconData icon;
  final List<ExpandableFabMenuItem> menuItems;

  const ExpandableFab({
    super.key,
    required this.icon,
    required this.menuItems,
  });

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool get isExpanded => _controller.isForwardOrCompleted;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    _animation = _controller.curvedTweenAnimation(begin: 0.0, end: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    if (isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        final screenWidth = MediaQuery.sizeOf(context).width;

        final xTween = Tween(
          begin: -screenWidth * (1 - index / widget.menuItems.length),
          end: 0.0,
        );

        return Transform(
          transform: Matrix4.translationValues(
            xTween.evaluate(_animation),
            0.0,
            0.0,
          ),
          child: Opacity(
            opacity: _animation.value,
            child: Align(alignment: Alignment.centerRight, child: child),
          ),
        );
      },
      child: widget.menuItems[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOverlay(
      animation: _animation,
      color: Colors.black,
      onPress: toggle,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (_, child) => IgnorePointer(
                  ignoring: _animation.isDismissed,
                  child: child,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.menuItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 9),
                  itemBuilder: _buildItem,
                ),
              ),
              FloatingActionButton(
                onPressed: toggle,
                child: AnimatedIcon(
                  icon: widget.icon,
                  progress: _animation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
