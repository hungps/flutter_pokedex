import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/modal.dart';
import 'package:pokedex/ui/widgets/search_bar.dart';

class SearchBottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom + 14;

    return Modal(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
            child: SearchBar(margin: EdgeInsets.all(0)),
          ),
          SizedBox(height: viewInsets),
        ],
      ),
    );
  }
}
