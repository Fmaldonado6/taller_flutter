import 'package:anime_app/models/models.dart';
import 'package:flutter/material.dart';

class AnimeGenres extends StatelessWidget {
  final List<Genre> genres;

  const AnimeGenres({Key key, this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: genres.map((e) => AnimeGenre(genre: e.name)).toList(),
        ),
      ),
    );
  }
}

class AnimeGenre extends StatelessWidget {
  final String genre;
  const AnimeGenre({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.indigo.shade400,
      ),
      child: Text(
        genre,
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
