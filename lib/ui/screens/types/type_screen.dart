import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/ui/screens/types/type_grid.dart';
import 'package:pokedex/ui/widgets/poke_container.dart';

// Class that is related to creating the whole type-effects page
class TypeEffectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokeballBackground(buildChildren: (props) {
        final appBarTop = props.size / 2 + props.top - IconTheme.of(context).size / 2;
        return [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: appBarTop),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const Positioned(
                      left: 0,
                      child: IconButton(
                        padding: EdgeInsets.all(24),
                        icon: Icon(Icons.arrow_back),
                        onPressed: AppNavigator.pop,
                      ),
                    ),
                    const Text(
                      'Type Effects',
                      style: TextStyle(
                        color: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: IconButton(
                        padding: EdgeInsets.all(24),
                        icon: Icon(Icons.menu),
                        onPressed: AppNavigator.pop,
                      ),
                    ),
                    // TypeList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 18,
                  left: 26,
                  right: 26,
                  bottom: 4,
                ),
                child: Text(
                  'Type Effects',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TypeEffectGrid() // type_grid
            ],
          ),
        ];
      }),
    );
  }
}
