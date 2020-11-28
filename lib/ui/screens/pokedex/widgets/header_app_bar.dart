part of '../pokedex.dart';

class _HeaderAppBar extends StatelessWidget {
  const _HeaderAppBar({
    this.top = 0.0,
    this.appBarKey,
  });

  final double top;
  final GlobalKey appBarKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: context.responsive(16)),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: IconButton(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: context.responsive(24),
              ),
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
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: context.responsive(24),
              ),
              icon: Icon(Icons.menu),
              onPressed: AppNavigator.pop,
            ),
          ),
        ],
      ),
    );
  }
}
