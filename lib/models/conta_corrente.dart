import 'conta_bancaria.dart';

class ContaCorrente<T> extends ContaBancaria<T> {
  double limite;

  ContaCorrente(T numeroConta, double saldo, this.limite) : super(numeroConta, saldo);

  @override
  void sacar(double valor) {
    if (valor <= saldo + limite) {
      saldo -= valor;
    } else {
      throw Exception('Saldo insuficiente e limite de crédito excedido');
    }
  }
}
