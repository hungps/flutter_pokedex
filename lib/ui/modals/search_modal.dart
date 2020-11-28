import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/modal.dart';
import 'package:pokedex/ui/widgets/search_bar.dart';
import 'package:pokedex/core/extensions/context.dart';

class SearchBottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Modal(
      child: Flexible(
        child: Padding(
          padding: EdgeInsets.only(
            left: 26,
            right: 26,
            top: context.responsive(14),
            bottom: context.responsive(14) + viewInsets + safeAreaBottom,
          ),
          child: SearchBar(margin: EdgeInsets.zero),
        ),
      ),
    );
  }
}
