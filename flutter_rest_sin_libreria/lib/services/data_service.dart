import 'package:flutter_rest_sin_libreria/models/user.dart';


//Servicio que nos regresa un Usuario a partir de un JSON
class DataService {
  User getNetworkData() {
    final json = {"username": "Fmaldonado", "email": "fmaldonado824@gmail.com"};

    return User.fromJson(json);
  }
}
