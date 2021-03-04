import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class TopAnimeResponse {
  List<Anime> top;

  TopAnimeResponse();

  factory TopAnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$TopAnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopAnimeResponseToJson(this);
}

@JsonSerializable()
class Anime {
  @JsonKey(name: "mal_id")
  int malId;
  @JsonKey(name: "image_url")
  String imageUrl;
  String title;
  int episodes;
  String status;
  double score;
  String synopsis;
  List<Genre> genres;

  Anime();

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Genre {
  String name;

  Genre();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
