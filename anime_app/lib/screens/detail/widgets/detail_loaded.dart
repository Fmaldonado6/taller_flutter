import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/detail/widgets/anime_genre.dart';
import 'package:anime_app/widgets/anime_image.dart';
import 'package:flutter/material.dart';

class DetailLoaded extends StatelessWidget {
  final Anime anime;

  const DetailLoaded({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .45;

    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: width,
              height: width * 1.3,
              child: AnimeImage(url: anime.imageUrl),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              anime.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnimeGenres(
              genres: anime.genres,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "${anime.status} ${anime.score}/10",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Sinopsis",
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
              child: Text(
                anime.synopsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
