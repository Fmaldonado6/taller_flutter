
//Clase de datos
class User {
  String username;
  String email;

  User(this.username, this.email);

  //Este factory nos regresa un nuevo usario a partir de un json
  //Un factory es muy parecido a un constructor pero podemos poner logica al crear el objeto
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["username"], json["email"]);
  }
}
