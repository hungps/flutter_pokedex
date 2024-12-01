import 'package:flutter/material.dart';

class ShadowCard extends StatelessWidget {
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final Widget child;

  const ShadowCard({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
