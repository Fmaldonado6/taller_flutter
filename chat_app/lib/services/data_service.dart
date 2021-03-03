import 'package:chat_app/models/exceptions.dart';
import 'package:dio/dio.dart';

class DataService {
  String baseUrl = "http://10.0.2.2:4000/api";
  String baseUrlWs = "ws://10.0.2.2:4000/websocket/client";

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
        case 403:
          throw Forbidden(e.error);
        case 404:
          throw NotFound(e.error);
        default:
          throw AppError(e.error);
      }
  }
}
