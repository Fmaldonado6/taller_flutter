import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/main/cubit/main_cubit.dart';
import 'package:anime_app/screens/main/cubit/main_state.dart';
import 'package:anime_app/screens/main/widgets/anime_item.dart';
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

  bool isScreenSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double padding = isScreenSmall(context) ? 0 : screenWidth * .25;

    return BlocBuilder(
      cubit: context.read<MainCubit>(),
      builder: (context, state) {
        if (state is MainLoadedState) this.animes = state.animes;

        return ListView.separated(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
            top: 15,
            bottom: 15,
          ),
          controller: _scrollController,
          separatorBuilder: (context, index) => Divider(),
          itemCount: this.animes.length,
          itemBuilder: (context, index) => AnimeItem(
            anime: this.animes[index],
          ),
        );
      },
    );
  }
}
