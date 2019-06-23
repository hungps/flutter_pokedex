import 'package:flutter/material.dart';
import 'package:pokedex/widgets/poke_news.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 9,
      separatorBuilder: (context, index) => Divider(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PokeNews(
          title: "Pokémon Rumble Rush Arrives Soon",
          time: "15 May 2019",
          thumbnail: Image.asset("assets/images/thumbnail.png"),
        );
      },
    );
  }
}
