import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/main/cubit/main_cubit.dart';
import 'package:anime_app/screens/main/cubit/main_state.dart';
import 'package:anime_app/screens/main/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLoaded extends StatefulWidget {
  const MainLoaded({Key key}) : super(key: key);

  @override
  _MainLoadedState createState() => _MainLoadedState();
}

class _MainLoadedState extends State<MainLoaded> {
  List<Anime> animes = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().setScrollController(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: context.read<MainCubit>(),
      builder: (context, state) {
        if (state is MainLoadedState) this.animes = state.animes;

        return GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 2,
          ),
          itemCount: this.animes.length,
          itemBuilder: (context, index) {
            return CharacterItem(
              anime: this.animes[index],
            );
          },
        );
      },
    );
  }
}
