import 'package:chat_app/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "";

    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ingrese nombre de usuario",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (String val) {
                  username = val;
                },
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: "Username",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                height: 50,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (username.isEmpty) return;

                    context.read<AuthCubit>().login(username);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    "Ingresar".toUpperCase(),
                    style: TextStyle(color: Colors.white, letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
