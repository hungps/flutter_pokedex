import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';

class PokeballScaffold extends Scaffold {
  PokeballScaffold({
    super.key,
    super.appBar,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
    super.persistentFooterAlignment,
    Widget? body,
  }) : super(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const PositionedPokeball(),
              if (body != null) body,
            ],
          ),
        );
}

class PositionedPokeball extends StatelessWidget {
  final double widthFraction;

  const PositionedPokeball({
    super.key,
    this.widthFraction = 0.664,
  });

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * widthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = AppAppBar.padding.right;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: Image(
        image: AppImages.pokeball,
        width: pokeballSize,
        height: pokeballSize,
        color: context.colors.text.withOpacity(0.05),
      ),
    );
  }
}
