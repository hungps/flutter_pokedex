import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pages/types/type_grid.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';

// Class that is related to creating the whole type-effects page
class TypeEffectScreen extends StatelessWidget {
  const TypeEffectScreen({super.key});

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      AppMovingTitleSliverAppBar(
        title: 'Type Effects',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: const TypeEffectGrid(),
      ),
    );
  }
}
