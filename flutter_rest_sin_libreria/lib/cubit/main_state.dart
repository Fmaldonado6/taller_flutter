import 'package:flutter_rest_sin_libreria/models/user.dart';

//Los diferentes estados que tendra la aplicacion
//En este caso tenemos una clase abstracta para que todos los estados
//sean del mismo tipo

//Despues tenemos 2 estados que es el estado de cargando y el estado de cargado
//Donde el estado de cargado cuenta con un campo de usuario que usaremos despues en la vista

abstract class MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  final User user;

  MainLoadedState(this.user);
}
