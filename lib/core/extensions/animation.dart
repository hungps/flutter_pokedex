import 'package:flutter/animation.dart';

extension AnimationControllerX on AnimationController {
  Animation<T> curvedTweenAnimation<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: this,
    ));
  }
}
