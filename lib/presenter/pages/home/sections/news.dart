part of '../home.dart';

class _NewsSection extends StatelessWidget {
  const _NewsSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pokémon News',
              style: context.typographies.headingSmall,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: context.colors.secondary),
              child: const Text('View All'),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 9,
          separatorBuilder: (_, __) => const Divider(height: 24),
          itemBuilder: (_, __) {
            return const _NewsListTile(
              title: 'Pokémon Rumble Rush Arrives Soon',
              time: '15 May 2019',
              thumbnail: AssetImage('assets/images/thumbnail.png'),
            );
          },
        ),
      ],
    );
  }
}
