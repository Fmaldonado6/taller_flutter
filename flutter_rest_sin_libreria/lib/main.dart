import 'package:flutter/material.dart';
import 'package:flutter_rest_sin_libreria/cubit/main_cubit.dart';
import 'package:flutter_rest_sin_libreria/cubit/main_state.dart';
import 'package:flutter_rest_sin_libreria/services/data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creamos el cubit con el data service
  MainCubit cubit = MainCubit(DataService());

  //Este es el widget que mostraremos, tiene un valor inicial de Container para mostrar un widget en blanco
  Widget body = Container();

  //Cuando inicie el widget obtenemos la informacion del cubit y escuchamos los cambios del streamController
  @override
  void initState() {
    super.initState();

    cubit.getData();

    cubit.controller.listen((event) {
      //Al haber un cambio de estado cambiamos el widget que debe mostrarse
      _getWidget(event);
    });
  }

  @override
    void dispose() {
      cubit.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }

  void _getWidget(MainState state) {
    //Si el estado es cargando cambiamos el widget a un spinner
    if (state is MainLoadingState)
      setState(() {
        body = Center(
          child: CircularProgressIndicator(),
        );
      });

    //Si el estado es cargado cambiamos el widget al contenido
    if (state is MainLoadedState)
      setState(
        () {
          body = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Usuario ${state.user.username}"),
                Text("Email ${state.user.email}"),
              ],
            ),
          );
        },
      );
  }
}
