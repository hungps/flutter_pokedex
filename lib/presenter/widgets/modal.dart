import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class AppBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool useSafeArea;
  final bool autoAvoidBottomInsets;
  final EdgeInsets padding;

  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.useSafeArea = true,
    this.autoAvoidBottomInsets = true,
    this.padding = const EdgeInsets.fromLTRB(24, 0, 24, 24),
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.paddingOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding.left),
            child: Text(title!, style: context.typographies.headingSmall),
          ),
        Padding(
          padding: padding,
          child: child,
        ),
        SizedBox(
          height: (useSafeArea ? safeArea.bottom : 0) +
              (autoAvoidBottomInsets ? viewInsets.bottom : 0),
        ),
      ],
    );
  }
}

class AppDraggableBottomSheet extends StatelessWidget {
  final String? title;
  final bool useSafeArea;
  final bool autoAvoidBottomInsets;
  final EdgeInsets padding;
  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;
  final Widget sliver;

  const AppDraggableBottomSheet({
    super.key,
    this.title,
    this.useSafeArea = true,
    this.autoAvoidBottomInsets = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.initialChildSize = 0.4,
    this.maxChildSize = 0.7,
    this.minChildSize = 0.4,
    required this.sliver,
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.paddingOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      expand: false,
      builder: (context, controller) => CustomScrollView(
        controller: controller,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: padding.left),
            sliver: SliverToBoxAdapter(
              child: Text(
                title!,
                style: context.typographies.headingSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: sliver,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: (useSafeArea ? safeArea.bottom : 0) +
                  (autoAvoidBottomInsets ? viewInsets.bottom : 0),
            ),
          ),
        ],
      ),
    );
  }
}
