import 'package:chat_app/injection_container.dart';
import 'package:chat_app/screens/auth/auth_page.dart';
import 'package:chat_app/screens/auth/cubit/auth_state.dart';
import 'package:chat_app/screens/chat_list/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/cubit/auth_cubit.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _authCubit = getIt.get<AuthCubit>();

  @override
  void initState() {
    super.initState();
    _authCubit.init();
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authCubit,
      child: BlocBuilder(
        cubit: _authCubit,
        builder: (context, state) {
          if (state is AuthStateLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (state is AuthStateCompleted)
            return ChatList(username: state.username);

          return AuthPage();
        },
      ),
    );
  }
}
