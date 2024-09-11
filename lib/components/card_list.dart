import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const CardList(this.titulo, this.subtitulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titulo),
        subtitle: Text(subtitulo),
      ),
    );
  }
}
