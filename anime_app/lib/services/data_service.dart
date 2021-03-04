import 'package:anime_app/models/exceptions.dart';
import 'package:dio/dio.dart';

class DataService {
  String baseUrl = "https://api.jikan.moe/v3";

  final Dio dio;

  DataService(this.dio) {
    this.dio.interceptors.add(InterceptorsWrapper(
          onError: catchError,
        ));
  }

  void catchError(DioError e) {
    if (e.type == DioErrorType.RESPONSE)
      switch (e.response.statusCode) {
        case 400:
          throw BadInput(e.error);
        case 404:
          throw NotFound(e.error);
        default:
          throw AppError(e.error);
      }
  }
}
