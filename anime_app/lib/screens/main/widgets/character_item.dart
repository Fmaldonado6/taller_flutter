import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/detail/datail_page.dart';
import 'package:anime_app/widgets/anime_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Anime anime;
  const CharacterItem({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextButton(
        onPressed: () {},
        child: Stack(
          children: [
            AnimeImage(url: this.anime.imageUrl),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(190),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                width: double.infinity,
                height: 35,
                child: Text(
                  this.anime.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          anime: this.anime,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
