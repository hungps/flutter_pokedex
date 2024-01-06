part of '../home.dart';

class _HeaderSection extends StatelessWidget implements PreferredSizeWidget {
  const _HeaderSection();

  @override
  Size get preferredSize => const Size.fromHeight(582);

  void _onThemeSwitcherPressed(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    final currentTheme = settingsBloc.state.theme;

    settingsBloc.add(SettingsThemeChanged(
      currentTheme is LightAppTheme ? const DarkAppTheme() : const LightAppTheme(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(-12, 0),
                child: SettingsThemeSelector(
                  builder: (theme) => ThemeSwitcherButton(
                    isDarkTheme: theme is DarkAppTheme,
                    onPressed: () => _onThemeSwitcherPressed(context),
                  ),
                ),
              ),
              const Spacer(),
              const Padding(padding: EdgeInsets.only(top: 24)),
              Text(
                'What Pokemon\nare you looking for?',
                style: context.appTheme.typographies.headingLarge,
              ),
              const Padding(padding: EdgeInsets.only(top: 36)),
              AppSearchBar(
                hintText: 'Search Pokemon, Move, Ability etc',
              ),
              const Padding(padding: EdgeInsets.only(top: 36)),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.58,
                  mainAxisSpacing: 15,
                ),
                children: [
                  _CategoryCard(
                    title: 'Pokedex',
                    color: AppColors.teal,
                    onPressed: () => AppNavigator.push(Routes.pokedex),
                  ),
                  const _CategoryCard(
                    title: 'Moves',
                    color: AppColors.red,
                  ),
                  const _CategoryCard(
                    title: 'Abilities',
                    color: AppColors.blue,
                  ),
                  _CategoryCard(
                    title: 'Items',
                    color: AppColors.yellow,
                    onPressed: () => AppNavigator.push(Routes.items),
                  ),
                  const _CategoryCard(
                    title: 'Locations',
                    color: AppColors.purple,
                  ),
                  _CategoryCard(
                    title: 'Type Effects',
                    color: AppColors.brown,
                    onPressed: () => AppNavigator.push(Routes.typeEffects),
                  ),
                ],
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
