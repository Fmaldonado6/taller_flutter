// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injection_container.dart' as _i10;
import 'screens/auth/cubit/auth_cubit.dart' as _i7;
import 'screens/chat/cubit/chat_cubit.dart' as _i8;
import 'screens/chat_list/cubit/chat_cubit.dart' as _i9;
import 'services/auth_service.dart' as _i3;
import 'services/chat_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AuthService>(
      () => _i3.AuthService(get<_i4.Dio>(), get<_i5.FlutterSecureStorage>()));
  gh.factory<_i6.ChatService>(() => _i6.ChatService(get<_i4.Dio>()));
  gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(get<_i3.AuthService>()));
  gh.factory<_i8.ChatCubit>(() => _i8.ChatCubit(get<_i6.ChatService>()));
  gh.factory<_i9.ChatListCubit>(
      () => _i9.ChatListCubit(get<_i6.ChatService>()));
  gh.singleton<_i4.Dio>(registerModule.dio);
  gh.singleton<_i5.FlutterSecureStorage>(registerModule.flutterSecureStorage);
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {
  @override
  _i5.FlutterSecureStorage get flutterSecureStorage =>
      _i5.FlutterSecureStorage();
}
