part of '../home.dart';

class _HeaderSection extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const _HeaderSection({
    required this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Text(
                  'What Pokemon\nare you looking for?',
                  style: context.appTheme.typographies.headingLarge,
                ),
              ),
              AppSearchBar(
                hintText: 'Search Pokemon, Move, Ability etc',
              ),
              GridView(
                padding: const EdgeInsets.symmetric(vertical: 36),
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
                    onPressed: () => context.router.push(const PokedexRoute()),
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
                    onPressed: () => context.router.push(const ItemsRoute()),
                  ),
                  const _CategoryCard(
                    title: 'Locations',
                    color: AppColors.purple,
                  ),
                  _CategoryCard(
                    title: 'Type Effects',
                    color: AppColors.brown,
                    onPressed: () => context.router.push(const TypeEffectRoute()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
