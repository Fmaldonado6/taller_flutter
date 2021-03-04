import 'package:anime_app/services/anime_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'detail_state.dart';

@injectable
class DetailCubit extends Cubit<DetailState> {
  final AnimeService _animeService;
  DetailCubit(this._animeService) : super(DetailLoadingState());

  Future getAnimeFullInfo(int id)async{

    try {
        final anime = await _animeService.getAnime(id);
        emit(DetailLoadedState(anime));
    } catch (e) {
    }

  }
}
