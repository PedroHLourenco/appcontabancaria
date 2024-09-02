class ContaBancaria<T> {
  T numeroConta;
  double saldo;

  ContaBancaria(this.numeroConta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
    } else {
      throw Exception('Saldo insuficiente');
    }
  }

  double verificarSaldo() => saldo;

  void transferir(ContaBancaria<T> contaDestino, double valor) {
    if (valor <= saldo) {
      sacar(valor);
      contaDestino.depositar(valor);
    } else {
      throw Exception('Saldo insuficiente para transferência');
    }
  }
}
