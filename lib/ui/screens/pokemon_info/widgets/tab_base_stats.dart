import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';
import 'package:pokedex/ui/widgets/progress.dart';
import 'package:pokedex/ui/widgets/spacer.dart';
import 'package:pokedex/utils/string.dart';
import 'package:pokedex/core/extensions/context.dart';

class Stat extends StatelessWidget {
  const Stat({
    required this.animation,
    required this.label,
    required this.value,
    this.progress,
  });

  final Animation animation;
  final String label;
  final double? progress;
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
              enableAnimation: animation.value == 1,
            ),
          ),
        ),
      ],
    );
  }
}

class PokemonBaseStats extends StatefulWidget {
  final Pokemon pokemon;
  final Animation scrollAnimation;

  const PokemonBaseStats(this.pokemon, this.scrollAnimation);

  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  Pokemon get pokemon => widget.pokemon;
  Animation get scrollAnimation => widget.scrollAnimation;

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

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  List<Widget> generateStatWidget() {
    return [
      Stat(animation: _animation, label: 'Hp', value: pokemon.stats.hp),
      VSpacer(context.responsive(14)),
      Stat(animation: _animation, label: 'Atttack', value: pokemon.stats.attack),
      VSpacer(context.responsive(14)),
      Stat(animation: _animation, label: 'Defense', value: pokemon.stats.defense),
      VSpacer(context.responsive(14)),
      Stat(animation: _animation, label: 'Sp. Atk', value: pokemon.stats.specialAttack),
      VSpacer(context.responsive(14)),
      Stat(animation: _animation, label: 'Sp. Def', value: pokemon.stats.specialDefense),
      VSpacer(context.responsive(14)),
      Stat(animation: _animation, label: 'Speed', value: pokemon.stats.speed),
      VSpacer(context.responsive(14)),
      Stat(
        animation: _animation,
        label: 'Total',
        value: 100,
        progress: 100 / 600,
      ),
    ];
  }

  List<Widget> _buildEffectivenesses() {
    final effectiveness = pokemon.typeEffectiveness;
    final list = effectiveness.keys
        .map(
          (type) => PokemonType(
            type,
            large: true,
            colored: true,
            extra: 'x' + removeTrailingZero(effectiveness[type] ?? 0),
          ),
        )
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...generateStatWidget(),
          VSpacer(context.responsive(27)),
          Text(
            'Type defenses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          VSpacer(context.responsive(15)),
          Text(
            'The effectiveness of each type on ${pokemon.name}.',
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
          VSpacer(context.responsive(15)),
          Wrap(
            spacing: context.responsive(8),
            runSpacing: context.responsive(8),
            children: _buildEffectivenesses(),
          ),
        ],
      ),
      builder: (context, child) {
        final scrollable = scrollAnimation.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: context.responsive(24),
            horizontal: 24,
          ),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
