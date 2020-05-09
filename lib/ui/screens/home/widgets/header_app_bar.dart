part of '../home.dart';

class _HeaderAppBar extends StatelessWidget {
  static const double heightFraction = 0.66;

  const _HeaderAppBar({this.height, this.showTitle});

  final double height;
  final bool showTitle;

  Widget _buildTitle(visible) {
    if (!visible) {
      return null;
    }

    return Text(
      'Pokedex',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCategories() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.44,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
      itemCount: categories.length,
      itemBuilder: (context, index) => PokeCategoryCard(
        categories[index],
        onPress: () => AppNavigator.push(Routes.pokedex),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: PokeballBackground(
        buildChildren: (props) => [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 117),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'What Pokemon\nare you looking for?',
                  style: TextStyle(
                    fontSize: 30,
                    height: 0.9,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 42),
                child: SearchBar(),
              ),
              _buildCategories(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      floating: true,
      pinned: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.red,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: _buildTitle(showTitle),
        background: _buildCard(),
      ),
    );
  }
}
