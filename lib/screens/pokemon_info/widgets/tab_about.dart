import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../configs/AppColors.dart';
import '../../../models/pokemon.dart';

class PokemonAbout extends StatelessWidget {
  Widget _buildSection(String text, {List<Widget> children, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16, height: 0.8, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 22),
        if (child != null) child,
        if (children != null) ...children
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.black.withOpacity(0.6),
        height: 0.8,
      ),
    );
  }

  Widget _buildDescription(String about) {
    return Text(
      about,
      style: TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight(String height, String weight) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel("Height"),
                SizedBox(height: 11),
                Text("$height", style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel("Weight"),
                SizedBox(height: 11),
                Text("$weight", style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding(Pokemon pokemon) {
    return _buildSection("Breeding", children: [
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Gender")),
          if (!pokemon.genderless) ...[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset("assets/images/male.png", width: 12, height: 12),
                  SizedBox(width: 4),
                  Text(pokemon.malePercentage, style: TextStyle(height: 0.8)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Image.asset("assets/images/female.png", width: 12, height: 12),
                  SizedBox(width: 4),
                  Text(pokemon.femalePercentage, style: TextStyle(height: 0.8)),
                ],
              ),
            ),
          ] else
            Expanded(
              flex: 3,
              child: Text(
                "Genderless",
                style: TextStyle(height: 0.8),
              ),
            ),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Egg Groups")),
          Expanded(flex: 3, child: Text(pokemon.eggGroups, style: TextStyle(height: 0.8))),
          //Expanded(flex: 2, child: SizedBox()),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Egg Cycle")),
          Expanded(child: Text(pokemon.cycles, style: TextStyle(height: 0.8))),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    ]);
  }

  Widget _buildLocation() {
    return _buildSection(
      "Location",
      child: AspectRatio(
        aspectRatio: 2.253,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTraining(String baseExp) {
    return _buildSection(
      "Training",
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: _buildLabel("Base EXP")),
          Expanded(flex: 3, child: Text(baseExp)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<AnimationController>(context);

    return AnimatedBuilder(
      animation: cardController,
      child: Consumer<PokemonModel>(
        builder: (_, model, child) => Column(
          children: <Widget>[
            _buildDescription(model.pokemon.about),
            SizedBox(height: 28),
            _buildHeightWeight(model.pokemon.height, model.pokemon.weight),
            SizedBox(height: 31),
            _buildBreeding(model.pokemon),
            SizedBox(height: 35),
            _buildLocation(),
            SizedBox(height: 26),
            _buildTraining(model.pokemon.baseExp),
          ],
        ),
      ),
      builder: (context, child) {
        final scrollable = cardController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
