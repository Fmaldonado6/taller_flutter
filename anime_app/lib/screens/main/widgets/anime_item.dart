import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/detail/datail_page.dart';
import 'package:anime_app/widgets/anime_image.dart';
import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  final Anime anime;
  const AnimeItem({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(anime.imageUrl),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              anime: anime,
            ),
          ),
        );
      },
      title: Text(anime.title),
    );
  }
}
