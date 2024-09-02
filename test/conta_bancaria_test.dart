import 'package:test/test.dart';
import 'package:appcontabancaria/models/conta_bancaria.dart';
import 'package:appcontabancaria/models/conta_corrente.dart';
import 'package:appcontabancaria/models/conta_poupanca.dart';

void main() {
  group('Conta', () {
    test('Deve permitir depósito e saque', () {
      final conta = ContaBancaria<int>(123, 100.0);

      conta.depositar(50.0);
      expect(conta.verificarSaldo(), equals(150.0));

      conta.sacar(20.0);
      expect(conta.verificarSaldo(), equals(130.0));
    });

    test('Deve permitir transferência entre contas', () {
      final contaOrigem = ContaBancaria<int>(123, 100.0);
      final contaDestino = ContaBancaria<int>(456, 200.0);

      contaOrigem.transferir(contaDestino, 50.0);
      expect(contaOrigem.verificarSaldo(), equals(50.0));
      expect(contaDestino.verificarSaldo(), equals(250.0));
    });

    test('Deve lançar exceção se tentar transferir além do saldo', () {
      final contaOrigem = ContaBancaria<int>(123, 100.0);
      final contaDestino = ContaBancaria<int>(456, 200.0);

      expect(() => contaOrigem.transferir(contaDestino, 150.0), throwsException);
    });
  });

  group('ContaCorrente', () {
    test('Deve permitir saque dentro do limite de crédito', () {
      final contaCorrente = ContaCorrente<int>(123, 100.0, 500.0);

      contaCorrente.sacar(550.0);
      expect(contaCorrente.verificarSaldo(), equals(-450.0));
    });

    test('Deve lançar exceção se tentar sacar além do limite de crédito', () {
      final contaCorrente = ContaCorrente<int>(123, 100.0, 500.0);

      expect(() => contaCorrente.sacar(650.0), throwsException);
    });
  });

  group('ContaPoupanca', () {
    test('Deve aplicar juros corretamente', () {
      final contaPoupanca = ContaPoupanca<int>(789, 200.0, 0.05);

      contaPoupanca.aplicarJuros();
      expect(contaPoupanca.verificarSaldo(), equals(210.0));
    });

    test('Deve permitir transferência entre contas poupança', () {
      final contaOrigem = ContaPoupanca<int>(789, 200.0, 0.05);
      final contaDestino = ContaPoupanca<int>(101, 100.0, 0.03);

      contaOrigem.transferir(contaDestino, 50.0);
      expect(contaOrigem.verificarSaldo(), equals(150.0));
      expect(contaDestino.verificarSaldo(), equals(150.0));
    });
  });
}
