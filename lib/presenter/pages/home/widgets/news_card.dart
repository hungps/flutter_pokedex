part of '../home.dart';

class _NewsListTile extends StatelessWidget {
  final ImageProvider thumbnail;
  final String title;
  final String time;
  final String url;

  const _NewsListTile({
    required this.title,
    required this.time,
    required this.thumbnail,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url),
            mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: context.typographies.body.withWeight(FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: context.typographies.caption
                      .withColor(context.colors.hint),
                ),
              ],
            ),
          ),
          const SizedBox(width: 36),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: thumbnail,
              width: 110,
              height: 66,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
