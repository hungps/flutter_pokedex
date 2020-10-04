import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
      await AppNavigator.replaceWith(Routes.home);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/gif/pika_loader.gif",
            width: 60,
            fit: BoxFit.fitWidth,
          ),
          Text(
            'Pokedex',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }
}
