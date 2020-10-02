import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/utils/string.dart';
import 'package:pokedex/widgets/pokemon_type.dart';
import 'package:provider/provider.dart';

import '../../../configs/AppColors.dart';
import '../../../models/pokemon.dart';
import '../../../widgets/progress.dart';

class Stat extends StatelessWidget {
  const Stat({
    Key key,
    @required this.animation,
    @required this.label,
    @required this.value,
    this.progress,
  }) : super(key: key);

  final Animation animation;
  final String label;
  final num value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final progress = this.progress == null ? this.value / 100 : this.progress;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text("$value"),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) => ProgressBar(
              progress: animation.value * progress,
              color: progress < 0.5 ? AppColors.red : AppColors.teal,
            ),
          ),
        ),
      ],
    );
  }
}

class PokemonBaseStats extends StatefulWidget {
  const PokemonBaseStats({Key key}) : super(key: key);

  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    _controller.forward();
  }

  List<Widget> generateStatWidget(Pokemon pokemon) {
    return [
      Stat(animation: _animation, label: "Hp", value: pokemon.hp),
      SizedBox(height: 14),
      Stat(animation: _animation, label: "Attack", value: pokemon.attack),
      SizedBox(height: 14),
      Stat(animation: _animation, label: "Defense", value: pokemon.defense),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Sp. Atk",
          value: pokemon.specialAttack),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Sp. Def",
          value: pokemon.specialDefense),
      SizedBox(height: 14),
      Stat(animation: _animation, label: "Speed", value: pokemon.speed),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Total",
          value: pokemon.total,
          progress: pokemon.total / 600),
    ];
  }

  List<Widget> buildEffectivenesses(Pokemon pokemon) {
    Map<String, double> effectiveness = getTypeEffectiveness(pokemon);
    List<Widget> list = new List();
    effectiveness.forEach((key, value) {
      list.add(
        PokemonType(
          key,
          large: true,
          colored: true,
          extra: 'x' + removeTrailingZero(value),
        ),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<AnimationController>(context);
    return AnimatedBuilder(
      animation: cardController,
      child: Consumer<PokemonModel>(
        builder: (_, model, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ...generateStatWidget(model.pokemon),
            SizedBox(height: 27),
            Text(
              "Type effectiveness",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 0.8,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "The effectiveness of each type on ${model.pokemon.name}.",
              style: TextStyle(color: AppColors.black.withOpacity(0.6)),
            ),
            SizedBox(height: 25),
            Wrap(
                spacing: 5,
                runSpacing: 5,
                children: buildEffectivenesses(model.pokemon)),
          ],
        ),
      ),
      builder: (context, child) {
        final scrollable = cardController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable
              ? BouncingScrollPhysics()
              : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
