import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/modal.dart';
import 'package:pokedex/ui/widgets/search_bar.dart';

class SearchBottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return Modal(
      child: Flexible(
        child: Padding(
          padding: EdgeInsets.only(left: 26, right: 26, top: 14, bottom: 14 + viewInsets),
          child: SearchBar(margin: EdgeInsets.all(0)),
        ),
      ),
    );
  }
}
