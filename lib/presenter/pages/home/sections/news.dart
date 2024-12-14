part of '../home.dart';

class _NewsSection extends StatelessWidget {
  const _NewsSection();

  Future<List<List<String>>> _fetchPokemonNews() async {
    final List<List<String>> _articles = [];
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=pokemon&sortBy=publishedAt&language=en&apiKey={YOUR API KEY}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'];
        for (var article in articles) {
          final title = article['title'];
          final date = article['publishedAt'];
          final url = article['url'];
          if (title != null &&
              (title.contains('Pokemon') || title.contains('Pokémon '))) {
            _articles.add([title, formatDate(date), url]);
          }
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return _articles;
  }

  String formatDate(String? date) {
    if (date == null) return 'Unknown Date';

    // Parse the date string to a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the date manually (e.g., "2024-12-11 06:37:41")
    return '${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')} ${parsedDate.hour.toString().padLeft(2, '0')}:${parsedDate.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<String>>>(
      future: _fetchPokemonNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
              child: Text('Check your internet connection: ${snapshot.error}'));
        }

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
                  style: TextButton.styleFrom(
                      foregroundColor: context.colors.secondary),
                  child: const Text('View All'),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              separatorBuilder: (_, __) => const Divider(height: 24),
              itemBuilder: (_, index) {
                final _articles = snapshot.data ?? [];
                return _NewsListTile(
                  title: _articles[index][0],
                  time: _articles[index][1],
                  url: _articles[index][2],
                  thumbnail: const AssetImage('assets/images/thumbnail.png'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
