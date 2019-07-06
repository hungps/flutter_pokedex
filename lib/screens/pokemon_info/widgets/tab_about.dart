import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/configs/AppColors.dart';

class PokemonAbout extends StatelessWidget {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Text(
        "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
        style: TextStyle(height: 1.3),
      ),
    );
  }

  Widget _buildHeightWeight() {
    return Container(
      margin: EdgeInsets.all(27),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Breeding",
            style: TextStyle(fontSize: 16, height: 0.8, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          Row(
            children: <Widget>[
              Expanded(child: _buildLabel("Gender")),
              Expanded(
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/male.svg", width: 12, height: 12),
                    SizedBox(width: 4),
                    Text("87.5%", style: TextStyle(height: 0.8)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/images/female.svg", width: 12, height: 12),
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 19),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        _buildDescription(),
        _buildHeightWeight(),
        _buildBreeding(),
      ],
    );
  }
}
