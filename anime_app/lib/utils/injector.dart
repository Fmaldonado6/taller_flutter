import 'package:anime_app/screens/detail/cubit/detail_cubit.dart';
import 'package:anime_app/screens/main/cubit/main_cubit.dart';
import 'package:anime_app/services/anime_service.dart';
import 'package:dio/dio.dart';

class Injector{

  static final AnimeService _animeService = AnimeService(Dio());

  static MainCubit getMainPageCubit() => MainCubit(_animeService);

  static DetailCubit getDetailPageCubit() => DetailCubit(_animeService);

}