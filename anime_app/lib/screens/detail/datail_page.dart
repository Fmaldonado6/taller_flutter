import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/detail/cubit/detail_state.dart';
import 'package:anime_app/screens/detail/widgets/detail_loaded.dart';
import 'package:anime_app/utils/injector.dart';
import 'package:anime_app/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailPage extends StatefulWidget {
  final Anime anime;

  const DetailPage({Key key, this.anime}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final detailCubit = Injector.getDetailPageCubit();

  @override
  void initState() {
    super.initState();
    detailCubit.getAnimeFullInfo(widget.anime.malId);
  }

  @override
  void dispose() {
    detailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.anime.title,
        ),
      ),
      body: BlocProvider(
        create: (context) => detailCubit,
        child: BlocBuilder(
          cubit: detailCubit,
          builder: (context, state) {
            if (state is DetailLoadingState)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (state is DetailLoadedState)
              return DetailLoaded(anime: state.anime);

            var error = "Error";

            if (state is DetailErrorState) error = state.error;

            return Center(
              child: ErrorMessage(
                retry: () => detailCubit.getAnimeFullInfo(widget.anime.malId),
                message: error,
              ),
            );
          },
        ),
      ),
    );
  }
}
