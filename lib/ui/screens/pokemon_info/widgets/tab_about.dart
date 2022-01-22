import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/ui/widgets/spacer.dart';
import 'package:pokedex/core/extensions/context.dart';

class PokemonAbout extends StatelessWidget {
  const PokemonAbout(this._pokemon, this._animation);

  final Pokemon _pokemon;
  final Animation _animation;

  Widget _buildSection(BuildContext context, String text, {List<Widget>? children, Widget? child}) {
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
        VSpacer(context.responsive(22)),
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

  Widget _buildHeightWeight(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: context.responsive(16),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, context.responsive(8)),
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
                VSpacer(context.responsive(11)),
                Text('${_pokemon.height}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel('Weight'),
                VSpacer(context.responsive(11)),
                Text('${_pokemon.weight}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding(BuildContext context) {
    return _buildSection(context, 'Breeding', children: [
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel('Gender')),
          if (!_pokemon.gender.genderless) ...[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image(image: AppImages.male, width: 12, height: 12),
                  HSpacer(4),
                  Text('${_pokemon.gender.male}%', style: TextStyle(height: 0.8)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Image(image: AppImages.female, width: 12, height: 12),
                  HSpacer(4),
                  Text('${_pokemon.gender.female}%', style: TextStyle(height: 0.8)),
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
      VSpacer(context.responsive(18)),
      Row(
        children: <Widget>[
          Expanded(child: _buildLabel('Egg Groups')),
          Expanded(
            flex: 2,
            child: Text(
              _pokemon.eggGroups.join(', '),
              style: TextStyle(height: 0.8),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
        ],
      ),
      VSpacer(context.responsive(18)),
      Row(
        children: <Widget>[
          Expanded(
            child: _buildLabel('Egg Cycle'),
          ),
          Expanded(
            flex: 2,
            child: Text(
              _pokemon.eggGroups.join(', '),
              style: TextStyle(height: 0.8),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    ]);
  }

  Widget _buildLocation(BuildContext context) {
    return _buildSection(
      context,
      'Location',
      child: AspectRatio(
        aspectRatio: 2.2,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTraining(BuildContext context) {
    return _buildSection(
      context,
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
          VSpacer(context.responsive(28)),
          _buildHeightWeight(context),
          VSpacer(context.responsive(31)),
          _buildBreeding(context),
          VSpacer(context.responsive(35)),
          _buildLocation(context),
          VSpacer(context.responsive(26)),
          _buildTraining(context),
        ],
      ),
      builder: (context, child) {
        final scrollable = _animation.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: context.responsive(19),
            horizontal: 27,
          ),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
