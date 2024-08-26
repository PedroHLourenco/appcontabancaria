import 'package:appcontabancaria/views/home.dart';
import 'package:flutter/material.dart';

class AppContabancaria extends StatelessWidget {
  const AppContabancaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Conta Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
