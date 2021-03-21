import 'package:flutter/material.dart';

class AnimeImage extends StatelessWidget {
  final String url;

  const AnimeImage({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(360),
            color: Colors.black.withAlpha(120),
            blurRadius: 6.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
