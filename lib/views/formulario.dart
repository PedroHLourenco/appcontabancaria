import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  final Function(String, String) onAdicionarConta;

  const Formulario({super.key, required this.onAdicionarConta});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _tituloController = TextEditingController();
  final _saldoController = TextEditingController();

  void _adicionarConta() {
    final titulo = _tituloController.text;
    final saldo = _saldoController.text;

    if (titulo.isEmpty || saldo.isEmpty) {
      return;
    }

    widget.onAdicionarConta(titulo, saldo);
    _tituloController.clear();
    _saldoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: _saldoController,
            decoration: const InputDecoration(labelText: 'Saldo'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _adicionarConta,
            child: const Text('Adicionar Conta'),
          ),
        ],
      ),
    );
  }
}
