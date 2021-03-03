import 'package:chat_app/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthStateInitial());

  Future init() async {
    final username = await _authService.getUsername();
    if (username == null) return emit(AuthStateInitial());

    emit(AuthStateCompleted(username));
  }

  Future login(String username) async {
    emit(AuthStateLoading());
    await _authService.saveUsername(username);
    emit(AuthStateCompleted(username));
  }
}
