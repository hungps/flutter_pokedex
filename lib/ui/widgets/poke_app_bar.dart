import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class PokeAppBar extends AppBar {
  PokeAppBar({Widget title, IconData rightIcon})
      : super(
          title: title,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 28),
            icon: Icon(Icons.arrow_back),
            onPressed: AppNavigator.pop,
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 28),
              child: Icon(rightIcon),
            ),
          ],
        );
}
