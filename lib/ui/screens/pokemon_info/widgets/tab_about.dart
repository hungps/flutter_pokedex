import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';

class PokemonAbout extends StatelessWidget {
  final Pokemon _pokemon;
  final Animation _animation;

  const PokemonAbout(this._pokemon, this._animation);

  Widget _buildSection(String text, {List<Widget> children, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            height: 0.8,
            fontWeight: FontWeight.bold,
          ),
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
      _pokemon.description,
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
                _buildLabel('Height'),
                SizedBox(height: 11),
                Text('${_pokemon.height}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel('Weight'),
                SizedBox(height: 11),
                Text('${_pokemon.weight}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding() {
    return _buildSection('Breeding', children: [
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel('Gender')),
          if (!_pokemon.gender.genderless) ...[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image(image: AppImages.male, width: 12, height: 12),
                  SizedBox(width: 4),
                  Text('${_pokemon.gender.male}%', style: TextStyle(height: 0.8)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Image(
                    image: AppImages.female,
                    width: 12,
                    height: 12,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${_pokemon.gender.female}%',
                    style: TextStyle(height: 0.8),
                  ),
                ],
              ),
            ),
          ] else
            Expanded(
              flex: 3,
              child: Text(
                'Genderless',
                style: TextStyle(height: 0.8),
              ),
            ),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel('Egg Groups')),
          Expanded(
            flex: 2,
            child: Text(
              _pokemon.eggGroups.map((e) => e.value).join(', '),
              style: TextStyle(height: 0.8),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
      SizedBox(height: 18),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel('Egg Cycle')),
          Expanded(
            flex: 2,
            child: Text(
              _pokemon.eggGroups.map((e) => e.value).join(', '),
              style: TextStyle(height: 0.8),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    ]);
  }

  Widget _buildLocation() {
    return _buildSection(
      'Location',
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

  Widget _buildTraining() {
    return _buildSection(
      'Training',
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: _buildLabel('Base EXP')),
          Expanded(flex: 3, child: Text('${_pokemon.baseExp}')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
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
        final scrollable = _animation.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
