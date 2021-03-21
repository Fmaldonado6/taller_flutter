import 'dart:async';

import 'package:flutter_rest_sin_libreria/cubit/main_state.dart';
import 'package:flutter_rest_sin_libreria/services/data_service.dart';


//El cubit se encarga de cambiar el estado de nuestra aplicacion
class MainCubit {

  DataService _dataService;

  //Este objeto streamController se encarga de exponer datos a la vista y saber cuando su valor cambia
  StreamController<MainState> _controller = StreamController<MainState>();

  //A través de este getter obtenemos el stream del stream controller
  Stream<MainState> get controller => _controller.stream;

  //Agregamos el servicio de datos a través de inyeccion de dependencias
  MainCubit(this._dataService);

  //Funcion para cerrar el stream y evitar fugas de memoria
  dispose() {
    _controller.close();
  }

  //Esta funcion se encarga de cambiar entre el estado de cargando y cargado
  getData() async {
    _controller.sink.add(MainLoadingState());

    final user = _dataService.getNetworkData();

    await Future.delayed(Duration(milliseconds: 5000));

    _controller.sink.add(MainLoadedState(user));
  }
}
