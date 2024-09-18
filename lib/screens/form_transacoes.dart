import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:flutter/material.dart';

class FormTransacoes extends StatefulWidget {
  final TextEditingController _ctrlValor = TextEditingController();

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
                controller: widget._ctrlValor,
                style: const TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _criaTransacoes(context);
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransacoes(BuildContext context) {
    double? valor = double.tryParse(widget._ctrlValor.text);

    if (valor != null) {
      final Transacao novaTransacao = Transacao(valor, TipoTransacao.credito);
      Navigator.pop(context, novaTransacao);
    }
  }
}
