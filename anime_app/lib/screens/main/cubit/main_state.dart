import 'package:anime_app/models/models.dart';

abstract class MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  List<Anime> animes;
  MainLoadedState(this.animes);
}

class MainErrorState extends MainState {
  String error;
  MainErrorState(this.error);
}





