part of '../home.dart';

class _HeaderAppBar extends StatelessWidget {
  static const double heightFraction = 0.66;

  const _HeaderAppBar({
    @required this.height,
    @required this.showTitle,
  });

  final double height;
  final bool showTitle;

  Widget _buildTitle(visible) {
    if (!visible) {
      return null;
    }

    return Text(
      'Pokedex',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.48,
        crossAxisSpacing: 10,
        mainAxisSpacing: context.responsive(12),
      ),
      padding: EdgeInsets.only(left: 28, right: 28),
      itemCount: categories.length,
      itemBuilder: (context, index) => PokeCategoryCard(
        categories[index],
        onPress: () => AppNavigator.push(categories[index].route),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: PokeballBackground(
        buildChildren: (_) => [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              VSpacer(context.responsive(60) + context.padding.top),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'What Pokemon\nare you looking for?',
                  style: TextStyle(
                    fontSize: 30,
                    height: (context.responsive(30) * 1.4 / 30),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              VSpacer(context.responsive(28)),
              SearchBar(),
              VSpacer(context.responsive(40)),
              _buildCategories(context),
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
        background: _buildCard(context),
      ),
    );
  }
}
