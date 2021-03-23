import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/detail/widgets/anime_genre.dart';
import 'package:anime_app/widgets/anime_image.dart';
import 'package:flutter/material.dart';

class DetailLoaded extends StatelessWidget {
  final Anime anime;

  const DetailLoaded({Key key, this.anime}) : super(key: key);

  bool isScreenSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    final double padding = isScreenSmall(context) ? 15 : screenWidth * .25;

    final imageWidth =
        isScreenSmall(context) ? screenWidth * .45 : screenWidth * .15;

    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        top: 15,
        bottom: 15,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: imageWidth,
              height: imageWidth * 1.3,
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
                    color: isDarkMode ? Colors.white : Colors.grey.shade700,
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
                    color: Theme.of(context).accentColor,
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
                color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
              ),
              child: Text(
                anime.synopsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
