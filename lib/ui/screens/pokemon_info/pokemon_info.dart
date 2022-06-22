import 'dart:math';

import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_props.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/ui/screens/pokemon_info/state_provider.dart';
import 'package:pokedex/ui/widgets/animated_fade.dart';
import 'package:pokedex/ui/widgets/animated_slide.dart';
import 'package:pokedex/ui/widgets/auto_slideup_panel.dart';
import 'package:pokedex/ui/widgets/hero.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/main_tab_view.dart';
import 'package:pokedex/ui/widgets/pokemon_image.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';
import 'package:pokedex/ui/widgets/progress.dart';
import 'package:pokedex/utils/string.dart';

import '../../../states/theme/theme_cubit.dart';

part 'sections/background_decoration.dart';
part 'sections/pokemon_overall_info.dart';
part 'sections/pokemon_info_card.dart';
part 'sections/pokemon_info_card_about.dart';
part 'sections/pokemon_info_card_basestats.dart';
part 'sections/pokemon_info_card_evolutions.dart';

class PokemonInfo extends StatefulWidget {
  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonInfoStateProvider(
      slideController: _slideController,
      rotateController: _rotateController,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _BackgroundDecoration(),
            _PokemonInfoCard(),
            _PokemonOverallInfo(),
          ],
        ),
      ),
    );
  }
}
