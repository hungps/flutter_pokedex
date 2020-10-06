import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/ui/widgets/poke_container.dart';

class TypeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        itemCount: types.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (builder, i) {
          return Card(
            color: types[i]["color"],
            shape: CircleBorder(),
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () {},
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black87, width: 2.5)),
                    ),
                  ),
                  Align(
                      child: Container(
                    height: 5,
                    color: Colors.white,
                  )),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: w / 7,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black87, width: 2.5)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/type_${types[i]["name"].toString().toUpperCase()}.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          );
          // Card(
          //   color: types[i]["color"],
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          //   child: Image.asset(
          //     "assets/images/type_${types[i]["name"].toString().toUpperCase()}.png",
          //   ),
          // );
        },
      ),
    );
  }
}

class TypeScreen extends StatelessWidget {
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
              TypeList()
            ],
          ),
        ];
      }),
    );
  }
}
