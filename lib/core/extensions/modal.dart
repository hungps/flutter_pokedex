import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  void showModel(Widget child) {
    showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }
}
