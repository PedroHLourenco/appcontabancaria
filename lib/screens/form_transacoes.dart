import 'package:flutter/material.dart';

class FormTransacoes extends StatefulWidget {
  final TextEditingController valor = TextEditingController();

  FormTransacoes({super.key});

  @override
  State<FormTransacoes> createState() => _FormTransacoesState();
}

class _FormTransacoesState extends State<FormTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Transações'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.valor,
                style: const TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(widget.valor.text);
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }
}
