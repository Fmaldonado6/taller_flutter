import 'package:anime_app/models/models.dart';
import 'package:anime_app/services/data_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnimeService extends DataService {
  AnimeService(Dio dio) : super(dio);

  Future<TopAnimeResponse> getAnimes(int page) async {
    Response response = await this.dio.get("${this.baseUrl}/top/anime/$page");
    return TopAnimeResponse.fromJson(response.data);
  }

  Future<Anime> getAnime(int id) async {
    Response response = await this.dio.get("${this.baseUrl}/anime/$id");
    return Anime.fromJson(response.data);
  }
}
