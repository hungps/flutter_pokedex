part of '../pokedex.dart';

class _FabOverlayBackground extends AnimatedWidget {
  const _FabOverlayBackground({
    required Animation animation,
    this.onPressOut,
  }) : super(listenable: animation);

  final void Function()? onPressOut;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: animation.value == 0,
      child: InkWell(
        onTap: onPressOut,
        child: Container(
          color: Colors.black.withOpacity(animation.value * 0.5),
        ),
      ),
    );
  }
}
