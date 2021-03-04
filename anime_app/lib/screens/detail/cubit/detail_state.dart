import 'package:anime_app/models/models.dart';

abstract class DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final Anime anime;

  DetailLoadedState(this.anime);
}

class DetailErrorState extends DetailState {
  final String error;

  DetailErrorState(this.error);
}
