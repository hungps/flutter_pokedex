import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/ui/widgets/progress.dart';

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
  final double progress;
  final num value;

  @override
  Widget build(BuildContext context) {
    final currentProgress = progress ?? value / 100;

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
          child: Text('$value'),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) => ProgressBar(
              progress: animation.value * currentProgress,
              color: currentProgress < 0.5 ? AppColors.red : AppColors.teal,
            ),
          ),
        ),
      ],
    );
  }
}

class PokemonBaseStats extends StatefulWidget {
  final Pokemon _pokemon;

  const PokemonBaseStats(this._pokemon);

  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  Pokemon get pokemon => widget._pokemon;

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

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    _controller.forward();
  }

  List<Widget> generateStatWidget() {
    return [
      Stat(animation: _animation, label: 'Hp', value: pokemon.stats.hp),
      SizedBox(height: 14),
      Stat(animation: _animation, label: 'Atttack', value: pokemon.stats.attack),
      SizedBox(height: 14),
      Stat(animation: _animation, label: 'Defense', value: pokemon.stats.defense),
      SizedBox(height: 14),
      Stat(animation: _animation, label: 'Sp. Atk', value: pokemon.stats.specialAttack),
      SizedBox(height: 14),
      Stat(animation: _animation, label: 'Sp. Def', value: pokemon.stats.specialDefense),
      SizedBox(height: 14),
      Stat(animation: _animation, label: 'Speed', value: pokemon.stats.speed),
      SizedBox(height: 14),
      Stat(
        animation: _animation,
        label: 'Total',
        value: 100,
        progress: 100 / 600,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...generateStatWidget(),
          SizedBox(height: 27),
          Text(
            'Type defenses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          SizedBox(height: 15),
          Text(
            // 'The effectiveness of each type on ${model.pokemon.name}.',
            'The effectiveness of each type on ',
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
