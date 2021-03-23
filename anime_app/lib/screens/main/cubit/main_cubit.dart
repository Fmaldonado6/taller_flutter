import 'package:anime_app/models/models.dart';
import 'package:anime_app/screens/main/cubit/main_state.dart';
import 'package:anime_app/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  AnimeService _animeService;
  int currentPage = 1;
  List<Anime> animes = [];
  ScrollController _scrollController;
  bool _canFetch = true;

  MainCubit(this._animeService) : super(MainLoadingState());

  Future getAnimes() async {
    emit(MainLoadingState());
    try {
      currentPage = 1;
      final topAnime = await this._animeService.getAnimes(currentPage);
      animes.addAll(topAnime.top);
      emit(MainLoadedState(animes));
    } catch (e) {
      emit(MainErrorState("Ocurrio un error en la consulta"));
    }
  }

  void setScrollController(ScrollController controller) {
    this._scrollController = controller;
    _scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (_scrollController.position.extentAfter == 0 && _canFetch) {
      _canFetch = false;
      fetchMoreAnimes();
    }
  }

  Future<void> fetchMoreAnimes() async {
    try {
      final animes = await _animeService.getAnimes(++currentPage);
      _canFetch = true;
      this.animes.addAll(animes.top);
      emit(MainLoadedState(this.animes));
    } catch (e) {
      print(e);
    }
  }
}
