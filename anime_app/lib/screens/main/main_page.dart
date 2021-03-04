import 'package:anime_app/screens/main/cubit/main_cubit.dart';
import 'package:anime_app/screens/main/cubit/main_state.dart';
import 'package:anime_app/screens/main/widgets/main_loaded.dart';
import 'package:anime_app/utils/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _mainCubit = getIt.get<MainCubit>();

  @override
  void initState() {
    super.initState();
    _mainCubit.getAnimes();
  }

  @override
  void dispose() {
    _mainCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Animes"),
      ),
      body: BlocProvider(
        create: (context) => _mainCubit,
        child: BlocBuilder<MainCubit, MainState>(
          cubit: _mainCubit,
          builder: (context, state) {
            if (state is MainLoadingState)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (state is MainErrorState)
              return Center(
                child: Text(state.error),
              );

            return MainLoaded();
          },
        ),
      ),
    );
  }
}
