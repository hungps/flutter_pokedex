import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:provider/provider.dart';

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

  Widget _buildDescription() {
    return Text(
      "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
      style: TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight() {
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
                Text("2’3.6” (0.70 cm)", style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel("Weight"),
                SizedBox(height: 11),
                Text("15.2 lbs (6.9 kg)", style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding() {
    return _buildSection("Breeding", children: [
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Gender")),
          Expanded(
            child: Row(
              children: <Widget>[
                Image.asset("assets/images/male.png", width: 12, height: 12),
                SizedBox(width: 4),
                Text("87.5%", style: TextStyle(height: 0.8)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Image.asset("assets/images/female.png", width: 12, height: 12),
                SizedBox(width: 4),
                Text("12.5%", style: TextStyle(height: 0.8)),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Egg Groups")),
          Expanded(child: Text("Monster", style: TextStyle(height: 0.8))),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel("Egg Cycle")),
          Expanded(child: Text("Grass", style: TextStyle(height: 0.8))),
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
          decoration: BoxDecoration(color: AppColors.teal, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildTraining() {
    return _buildSection(
      "Training",
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: _buildLabel("Base EXP")),
          Expanded(flex: 3, child: Text("64")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<AnimationController>(context);

    return AnimatedBuilder(
      animation: cardController,
      child: Column(
        children: <Widget>[
          _buildDescription(),
          SizedBox(height: 28),
          _buildHeightWeight(),
          SizedBox(height: 31),
          _buildBreeding(),
          SizedBox(height: 35),
          _buildLocation(),
          SizedBox(height: 26),
          _buildTraining(),
        ],
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
