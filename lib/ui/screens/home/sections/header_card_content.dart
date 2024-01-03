part of '../home.dart';

class _HeaderCardContent extends StatelessWidget {
  static const double height = 582;

  void _onSelectCategory(Category category) {
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: PokeballBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SettingsThemeSelector(builder: (theme) {
                    return IconButton(
                        iconSize: 25,
                        onPressed: () => context.read<SettingsBloc>().add(
                              theme is LightAppTheme
                                  ? const SettingsThemeChanged(DarkAppTheme())
                                  : const SettingsThemeChanged(LightAppTheme()),
                            ),
                        icon: Icon(
                          theme is LightAppTheme
                              ? Icons.dark_mode_outlined
                              : Icons.wb_sunny_outlined,
                        ));
                  }),
                ),
              ),
              _buildTitle(),
              const SizedBox(height: 16),
              const AppSearchBar(),
              _buildCategories(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'What Pokemon\nare you looking for?',
          style: TextStyle(
            fontSize: 30,
            height: 1.6,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 42, bottom: 62),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
        mainAxisSpacing: 15,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories[index],
          onPress: () => _onSelectCategory(categories[index]),
        );
      },
    );
  }
}
