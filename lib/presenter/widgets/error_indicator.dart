import 'package:flutter/material.dart';

class AppErrorIndicator extends StatelessWidget {
  const AppErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.warning_amber_rounded,
        size: 60,
        color: Colors.black26,
      ),
    );
  }
}
