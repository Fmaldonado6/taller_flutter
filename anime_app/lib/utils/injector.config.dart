// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../screens/detail/cubit/detail_cubit.dart' as _i5;
import '../screens/main/cubit/main_cubit.dart' as _i6;
import '../services/anime_service.dart' as _i3;
import 'injector.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AnimeService>(() => _i3.AnimeService(get<_i4.Dio>()));
  gh.factory<_i5.DetailCubit>(() => _i5.DetailCubit(get<_i3.AnimeService>()));
  gh.factory<_i6.MainCubit>(() => _i6.MainCubit(get<_i3.AnimeService>()));
  gh.singleton<_i4.Dio>(registerModule.dio);
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
