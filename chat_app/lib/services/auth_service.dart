import 'dart:convert';

import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/data_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@Injectable()
class AuthService extends DataService {
  static String username;

  final FlutterSecureStorage _secureStorage;

  AuthService(Dio dio, this._secureStorage) : super(dio);


  Future<void> signOut() async {
    await _secureStorage.delete(key: "username");
    AuthService.username = null;
  }

  Future<void> saveUsername(String username) async {
    AuthService.username = username;
    await _secureStorage.write(key: "username", value: username);
  }

  Future<String> getUsername() async {
    return await _secureStorage.read(key: "username");
  }
}
