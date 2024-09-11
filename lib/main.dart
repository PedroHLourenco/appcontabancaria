import 'package:appcontabancaria/screens/form_transacoes.dart';
import 'package:appcontabancaria/screens/list_transacoes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBank());
}

class MyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[900],
          textTheme: ButtonTextTheme.primary),
      ),
      home: ListaTransacoes(),
    );
  }
}
