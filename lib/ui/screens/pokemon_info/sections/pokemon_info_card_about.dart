part of '../pokemon_info.dart';

class _Label extends Text {
  _Label(String text, bool isDark)
      : super(
          text,
          style: TextStyle(
            color: isDark ? AppColors.whiteGrey.withOpacity(0.6) : AppColors.black.withOpacity(0.6),
            height: 0.8,
          ),
        );
}

class _ContentSection extends StatelessWidget {
  final String label;
  final List<Widget>? children;

  const _ContentSection({
    Key? key,
    required this.label,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(height: 0.8, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 22),
        if (children != null) ...children!
      ],
    );
  }
}

class _TextIcon extends StatelessWidget {
  final ImageProvider icon;
  final String text;

  const _TextIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: icon, width: 12, height: 12),
        SizedBox(width: 4),
        Text(text, style: TextStyle(height: 0.8)),
      ],
    );
  }
}

class _PokemonAbout extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonAbout(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final slideController = PokemonInfoStateProvider.of(context).slideController;

    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        children: <Widget>[
          _buildDescription(pokemon.description),
          SizedBox(height: 28),
          _buildHeightWeight(pokemon.height, pokemon.weight, context, isDark),
          SizedBox(height: 31),
          _buildBreeding(pokemon.gender, pokemon.eggGroups, isDark),
          SizedBox(height: 35),
          _buildLocation(),
          SizedBox(height: 26),
          _buildTraining(pokemon.baseExp, isDark),
        ],
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight(String height, String weight, BuildContext context, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Height', isDark),
                SizedBox(height: 11),
                Text(
                  '${height}',
                  style: TextStyle(
                    height: 0.8,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Weight', isDark),
                SizedBox(height: 11),
                Text('${weight}',
                    style: TextStyle(
                      height: 0.8,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding(PokemonGender gender, List<String> eggGroups, bool isDark) {
    return _ContentSection(
      label: 'Breeding',
      children: [
        Row(
          children: <Widget>[
            Expanded(child: _Label('Gender', isDark)),
            if (gender.genderless)
              Expanded(
                flex: 3,
                child: Text('Genderless', style: TextStyle(height: 0.8)),
              )
            else ...[
              Expanded(
                child: _TextIcon(AppImages.male, '${gender.male}%'),
              ),
              Expanded(
                flex: 2,
                child: _TextIcon(AppImages.female, '${gender.female}%'),
              ),
            ],
          ],
        ),
        SizedBox(height: 18),
        Row(
          children: <Widget>[
            Expanded(child: _Label('Egg Groups', isDark)),
            Expanded(
              flex: 2,
              child: Text(eggGroups.join(', '), style: TextStyle(height: 0.8)),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return _ContentSection(
      label: 'Location',
      children: [
        AspectRatio(
          aspectRatio: 2.2,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTraining(double baseExp, bool isDark) {
    return _ContentSection(
      label: 'Training',
      children: [
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: _Label('Base EXP', isDark)),
            Expanded(flex: 3, child: Text('${baseExp}')),
          ],
        ),
      ],
    );
  }
}
