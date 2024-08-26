import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Conta Bancária'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Conta Corrente'),
              subtitle: Text('R\$ 100,00'),
              leading: Icon(Icons.account_balance_wallet),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Conta Poupança'),
              subtitle: Text('Saldo: R\$ 10.000,00'),
              leading: Icon(Icons.savings),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Investimentos'),
              subtitle: Text('Saldo: R\$ 50.000,00'),
              leading: Icon(Icons.trending_up),
            ),
          ),
        ],
      ),
    );
  }
}
