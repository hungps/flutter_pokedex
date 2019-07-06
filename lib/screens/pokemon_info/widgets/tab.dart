import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/screens/pokemon_info/widgets/tab_about.dart';

class PokemonTabInfo extends StatelessWidget {
  Widget _buildTabBar() {
    return TabBar(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: AppColors.indigo,
      tabs: <Widget>[
        Tab(text: "About"),
        Tab(text: "Base Stats"),
        Tab(text: "Evolution"),
        Tab(text: "Moves"),
      ],
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
        children: <Widget>[
          PokemonAbout(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.orange),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.536,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.03),
            _buildTabBar(),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }
}
