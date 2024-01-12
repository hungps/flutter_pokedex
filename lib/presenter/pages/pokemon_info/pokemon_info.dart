import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/entities/pokemon_properties.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_event.dart';
import 'package:pokedex/data/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/pages/pokemon_info/state_provider.dart';
import 'package:pokedex/presenter/themes/colors.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/widgets/animated_fade.dart';
import 'package:pokedex/presenter/widgets/animated_slide.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/auto_slideup_panel.dart';
import 'package:pokedex/presenter/widgets/hero.dart';
import 'package:pokedex/presenter/widgets/main_tab_view.dart';
import 'package:pokedex/presenter/widgets/pokemon_image.dart';
import 'package:pokedex/presenter/widgets/pokemon_type.dart';
import 'package:pokedex/presenter/widgets/progress.dart';
import 'package:pokedex/utils/string.dart';

part 'sections/background_decoration.dart';
part 'sections/pokemon_info_card.dart';
part 'sections/pokemon_info_card_about.dart';
part 'sections/pokemon_info_card_basestats.dart';
part 'sections/pokemon_info_card_evolutions.dart';
part 'sections/pokemon_overall_info.dart';

@RoutePage()
class PokemonInfoPage extends StatefulWidget {
  final String id;

  const PokemonInfoPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  PokemonInfoState createState() => PokemonInfoState();
}

class PokemonInfoState extends State<PokemonInfoPage> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
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
      child: const Scaffold(
        body: Stack(
          fit: StackFit.expand,
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
