part of '../home.dart';

class _CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const _CategoryCard({
    required this.title,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final height = constraints.maxHeight;

      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _CardShadow(color: color),
          ),
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: color,
              disabledBackgroundColor: color,
              disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: ClipRRect(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: _CircleDecorator(size: height),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _PokeballDecorator(size: height),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      title,
                      style: context.typographies.body.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _CardShadow extends StatelessWidget {
  const _CardShadow({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, 6),
            blurRadius: 23,
          ),
        ],
      ),
    );
  }
}

class _CircleDecorator extends StatelessWidget {
  final double size;

  const _CircleDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-size * 0.5, -size * 0.6),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }
}

class _PokeballDecorator extends StatelessWidget {
  final double size;

  const _PokeballDecorator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Image.asset(
        'assets/images/pokeball.png',
        width: size,
        height: size,
        color: Colors.white.withOpacity(0.14),
        fit: BoxFit.contain,
      ),
    );
  }
}
