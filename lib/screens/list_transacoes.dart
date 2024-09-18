import 'package:appcontabancaria/components/card_list.dart';
import 'package:appcontabancaria/models/enums/tipo_transacao.dart';
import 'package:appcontabancaria/models/transacao.dart';
import 'package:appcontabancaria/screens/form_transacoes.dart';
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
            var tipo = widget._transacoes[indice].tipoTransacao.name;

            return CardList(valor, tipo);
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormTransacoes();
            })).then((novaTransacao) => _atualizarTransacoes(novaTransacao));
          }),
    );
  }

  void _atualizarTransacoes(Transacao novaTransacao) {
    if (novaTransacao != null) {
      setState(() {
        widget._transacoes.add(novaTransacao);
      });
    }
  }
}
