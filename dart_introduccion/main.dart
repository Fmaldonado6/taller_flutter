import 'dart:io';

void main() {}

void variables({int? argumento}) {
  String variable1 = "Hola";
  var variable2 = "Hola";

  final variable3 = "Hola";
  final String variable4 = "Hola";

  int? variableNula = argumento;

  if (variableNula != null) print(variableNula);
}

void loops() {
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  var i = 0;

  while (i != 5) {
    i++;
    print(i);
  }
}

void input() {
  var entrada = stdin.readLineSync();
  print("Valor de entrada $entrada");
}

int suma(int valor1, int valor2) => valor1 + valor2;

void oop() {
  Gun arma = Gun(damage: 0);

  print(arma.damage);
  print(arma.delay);

  arma.attack();
}

class Gun {
  int damage;
  int delay;

  Gun({required this.damage, this.delay = 20});

  void attack() {
    print("Attack");
  }

  void reload() {
    print("Reload");
  }
}

class Sword extends Gun {
  Sword(int damage, int delay) : super(damage: damage, delay: delay);

  @override
  void attack() {
    print("Sword attack");
  }

  void defend() {}
}
