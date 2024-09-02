// conta_poupanca.dart
import 'conta_bancaria.dart';

class ContaPoupanca<T> extends ContaBancaria<T> {
  double taxaDeJuros;

  ContaPoupanca(T numeroConta, double saldo, this.taxaDeJuros) : super(numeroConta, saldo);

  void aplicarJuros() {
    saldo += saldo * taxaDeJuros;
  }
}
