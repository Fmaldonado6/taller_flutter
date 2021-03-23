import 'package:anime_app/models/models.dart';
import 'package:dio/dio.dart';

class AnimeService {
  String baseUrl = "https://api.jikan.moe/v3";
  final Dio dio;

  AnimeService(this.dio);

  Future<TopAnimeResponse> getAnimes(int page) async {
    Response response = await this.dio.get("${this.baseUrl}/top/anime/$page");

    if (response.statusCode != 200) throw new DioError();

    return TopAnimeResponse.fromJson(response.data);
  }

  Future<Anime> getAnime(int id) async {
    Response response = await this.dio.get("${this.baseUrl}/anime/$id");

    if (response.statusCode != 200) throw new DioError();

    return Anime.fromJson(response.data);
  }
}
