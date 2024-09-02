import 'package:flutter/material.dart';
import 'formulario.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> _contas = [];

  void _adicionarConta(String titulo, String saldo) {
    setState(() {
      _contas.add({'titulo': titulo, 'saldo': saldo});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Conta Bancária'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _contas.length,
              itemBuilder: (context, index) {
                final conta = _contas[index];
                return Card(
                  child: ListTile(
                    title: Text(conta['titulo']!),
                    subtitle: Text('Saldo: R\$ ${conta['saldo']}'),
                    leading: Icon(Icons.account_balance_wallet),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Formulario(onAdicionarConta: _adicionarConta),
          ),
        ],
      ),
    );
  }
}
