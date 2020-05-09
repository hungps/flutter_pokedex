part of '../pokedex.dart';

class _HeaderAppBar extends StatelessWidget {
  final double top;
  final GlobalKey appBarKey;

  const _HeaderAppBar({Key key, this.top, this.appBarKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: IconButton(
              padding: EdgeInsets.all(24),
              icon: Icon(Icons.arrow_back),
              onPressed: AppNavigator.pop,
            ),
          ),
          Text(
            'Pokedex',
            key: appBarKey,
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              padding: EdgeInsets.all(24),
              icon: Icon(Icons.menu),
              onPressed: AppNavigator.pop,
            ),
          ),
        ],
      ),
    );
  }
}
