import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/utils/size.dart';

class AppAppBar extends AppBar {
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 28);

  AppAppBar({
    super.key,
    super.title,
    super.foregroundColor,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          leading: leading ?? const AppBarBackButton(),
          actions: <Widget>[
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
        );
}

class AppExpandableSliverAppBar extends SliverAppBar {
  static const BorderRadius _borderRadius = BorderRadius.vertical(bottom: Radius.circular(30));

  AppExpandableSliverAppBar({
    super.floating = true,
    super.pinned = true,
    super.primary = true,
    super.shape = const RoundedRectangleBorder(borderRadius: _borderRadius),
    super.actions,
    super.automaticallyImplyLeading,
    super.backgroundColor,
    super.bottom,
    super.centerTitle,
    super.collapsedHeight,
    super.elevation,
    super.excludeHeaderSemantics,
    super.iconTheme,
    super.actionsIconTheme,
    super.forceElevated,
    super.key,
    super.leading,
    super.shadowColor,
    super.snap,
    super.stretch,
    super.toolbarHeight,
    super.toolbarTextStyle,
    super.clipBehavior,
    super.forceMaterialTransparency,
    super.foregroundColor,
    super.leadingWidth,
    super.onStretchTrigger,
    super.scrolledUnderElevation,
    super.stretchTriggerOffset,
    super.surfaceTintColor,
    super.systemOverlayStyle,
    Widget title = const SizedBox.shrink(),
    PreferredSizeWidget? background,
  }) : super(
          expandedHeight: background?.preferredSize.height,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: title,
            titlePadding: const EdgeInsets.symmetric(vertical: 16),
            background: ClipRRect(
              borderRadius: _borderRadius,
              child: background,
            ),
          ),
        );
}

class AppMovingTitleSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  AppMovingTitleSliverAppBar({
    super.key,
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + 48,
    double expandedFontSize = 30,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          expandedHeight: height,
          pinned: true,
          backgroundColor: Colors.transparent,
          leading: leading ?? const AppBarBackButton(),
          actions: [
            if (trailing != null)
              AppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final safeAreaTop = MediaQuery.paddingOf(context).top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent = (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth = getTextSize(context, title, currentTextStyle).width;
              final startX = AppAppBar.padding.left;
              final endX = MediaQuery.sizeOf(context).width / 2 - textWidth / 2 - startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color: context.colors.background.withOpacity(0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset: Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class AppBarButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppBarButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: AppAppBar.padding,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppBarBackButton({
    super.key,
    this.icon = const Icon(Icons.arrow_back_rounded),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (!context.router.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: AppAppBar.padding,
      onPressed: onPressed ?? context.router.pop,
      icon: icon,
    );
  }
}
