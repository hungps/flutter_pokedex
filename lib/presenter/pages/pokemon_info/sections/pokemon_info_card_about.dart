part of '../pokemon_info.dart';

class _Label extends StatelessWidget {
  final String text;

  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
        height: 0.8,
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  final String label;
  final List<Widget>? children;

  const _ContentSection({
    required this.label,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(height: 0.8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 22),
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
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(height: 0.8)),
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

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics:
              scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        children: <Widget>[
          _buildDescription(pokemon.description),
          const SizedBox(height: 28),
          _buildHeightWeight(pokemon.height, pokemon.weight, context),
          const SizedBox(height: 31),
          _buildBreeding(pokemon.gender, pokemon.eggGroups),
          const SizedBox(height: 35),
          _buildLocation(context),
          const SizedBox(height: 26),
          _buildTraining(pokemon.baseExp),
        ],
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight(String height, String weight, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.colors.background,
        boxShadow: context.styles.cardShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const _Label('Height'),
                const SizedBox(height: 11),
                Text(
                  height,
                  style: const TextStyle(
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
                const _Label('Weight'),
                const SizedBox(height: 11),
                Text(weight,
                    style: const TextStyle(
                      height: 0.8,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreeding(PokemonGender gender, List<String> eggGroups) {
    return _ContentSection(
      label: 'Breeding',
      children: [
        Row(
          children: <Widget>[
            const Expanded(child: _Label('Gender')),
            if (gender.genderless)
              const Expanded(
                flex: 3,
                child: Text('Genderless', style: TextStyle(height: 0.8)),
              )
            else ...[
              Expanded(
                child: _TextIcon(Assets.images.male.provider(), '${gender.maleRate}%'),
              ),
              Expanded(
                flex: 2,
                child: _TextIcon(Assets.images.female.provider(), '${gender.femaleRate}%'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: <Widget>[
            const Expanded(child: _Label('Egg Groups')),
            Expanded(
              flex: 2,
              child: Text(eggGroups.join(', '), style: const TextStyle(height: 0.8)),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return _ContentSection(
      label: 'Location',
      children: [
        AspectRatio(
          aspectRatio: 2.2,
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.backgroundDark,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTraining(double baseExp) {
    return _ContentSection(
      label: 'Training',
      children: [
        Row(
          children: <Widget>[
            const Expanded(flex: 1, child: _Label('Base EXP')),
            Expanded(flex: 3, child: Text('$baseExp')),
          ],
        ),
      ],
    );
  }
}
