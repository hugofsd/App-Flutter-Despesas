import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  //import da class de transações
  final _transactions = {
    Transaction(
      id: 't1',
      title: 'Novo Celular',
      value: 1500.73,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Nova JBL (Caixa de som)',
      value: 500.00,
      date: DateTime.now(),
    ),
  };

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random()
            .nextDouble()
            .toString(), //converte o valor randomicamente para double e depois para string de id unico
        title: title,
        date: DateTime.now(),
        value: value);

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
