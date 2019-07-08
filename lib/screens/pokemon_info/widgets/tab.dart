import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/screens/pokemon_info/widgets/tab_about.dart';
import 'package:pokedex/screens/pokemon_info/widgets/tab_base_stats.dart';

class TabData {
  final String label;
  final Widget child;

  TabData(this.label, this.child);
}

class PokemonTabInfo extends StatelessWidget {
  final List<TabData> _tabs = [
    TabData("About", PokemonAbout()),
    TabData("Base Stats", PokemonBaseStats()),
    TabData("Evolution", Container(color: Colors.green)),
    TabData("Moves", Container(color: Colors.orange)),
  ];

  Widget _buildTabBar() {
    return TabBar(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: AppColors.indigo,
      tabs: _tabs.map((tab) => Text(tab.label)).toList(),
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
        children: _tabs.map((tab) => tab.child).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.536,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
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
