import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';
final getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}
