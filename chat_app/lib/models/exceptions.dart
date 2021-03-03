import 'package:dio/dio.dart';

class AppError extends DioError {
  String errorMessage;
  AppError(this.errorMessage);
}

class BadInput extends AppError {
  BadInput(String errorMessage) : super(errorMessage);
}

class Forbidden extends AppError {
  Forbidden(String errorMessage) : super(errorMessage);
}

class NotFound extends AppError {
  NotFound(String errorMessage) : super(errorMessage);
}
