import 'package:appcontabancaria/components/card_list.dart';
import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:flutter/material.dart';

class ListaTransacoes extends StatefulWidget {
  final List<Transacao> _transacoes = [
    Transacao(250.99, TipoTransacao.credito),
    Transacao(55.22, TipoTransacao.debito),
  ];

  ListaTransacoes({super.key});

  @override
  State<ListaTransacoes> createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Transações'),
      ),
      body: ListView.builder(
          itemCount: widget._transacoes.length,
          itemBuilder: (context, indice) {
            var valor = widget._transacoes[indice].valor.toString();
            var tipo = widget._transacoes[indice].tipoTransacao.toString();

            return CardList(valor, tipo);
          }),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
