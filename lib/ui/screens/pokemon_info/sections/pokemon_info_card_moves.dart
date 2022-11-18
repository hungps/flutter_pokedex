part of '../pokemon_info.dart';



class _PokemonMoves extends StatefulWidget {
  final Pokemon pokemon;

  const _PokemonMoves(this.pokemon);

  @override
  _PokemonMovesState createState() => _PokemonMovesState();
}

class _PokemonMovesState extends State<_PokemonMoves> {
  Pokemon get pokemon => widget.pokemon;




    Future<List<Widget>> getMoves() async {
      List<Widget> movesList = [];
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/" + pokemon.name.toLowerCase() + "/")).then((response) async {
        var data = jsonDecode(response.body);
        var moves = data['moves'];

        for (var move in moves){
          ReCase rc = ReCase(move['move']['name']);

          await http.get(Uri.parse(move['move']['url'])).then((value)  {
            var moveData = jsonDecode(value.body);
            ReCase moveType = ReCase(moveData['type']['name']);

            movesList.add(
                ListTileTheme(
                  contentPadding: EdgeInsets.all(0),

                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Text(rc.titleCase),

                      ],
                    ),
                    children: <Widget>[

                      ListTile(title: Text("Power: " + moveData['power'].toString()),),
                      ListTile(title: Text("Accuracy: " + moveData['accuracy'].toString()),),
                      ListTile(title: Text("PP: " + moveData['pp'].toString()),),
                      ListTile(title: Text("Type: " + moveType.titleCase),),

                    ],


                  ),
                )
            );
          });

        }

      });

    return movesList;
  }


  @override
  Widget build(BuildContext context) {


    final slideController = PokemonInfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 31, horizontal: 28),
          child: child,
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Move List!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 0.8,
            ),
          ),
          SizedBox(height: 28),
          //FutureBuilder to make API call
          FutureBuilder(
            future: getMoves(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData) {


                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => Divider(height: 58),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return snapshot.data[index];
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ],
      ),
    );
  }
}
