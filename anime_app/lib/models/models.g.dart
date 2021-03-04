// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopAnimeResponse _$TopAnimeResponseFromJson(Map<String, dynamic> json) {
  return TopAnimeResponse()
    ..top = (json['top'] as List)
        ?.map(
            (e) => e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TopAnimeResponseToJson(TopAnimeResponse instance) =>
    <String, dynamic>{
      'top': instance.top,
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime()
    ..malId = json['mal_id'] as int
    ..imageUrl = json['image_url'] as String
    ..title = json['title'] as String
    ..episodes = json['episodes'] as int
    ..status = json['status'] as String
    ..score = (json['score'] as num)?.toDouble()
    ..synopsis = json['synopsis'] as String
    ..genres = (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'episodes': instance.episodes,
      'status': instance.status,
      'score': instance.score,
      'synopsis': instance.synopsis,
      'genres': instance.genres,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre()..name = json['name'] as String;
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'name': instance.name,
    };
