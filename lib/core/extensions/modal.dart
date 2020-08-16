import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  void showModal(Widget child) {
    showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }
}
