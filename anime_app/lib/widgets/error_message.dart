import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final Function retry;

  const ErrorMessage({
    Key key,
    this.message = "Error",
    @required this.retry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        ElevatedButton(
          onPressed: retry,
          child: Text("Reintentar"),
        )
      ],
    );
  }
}
