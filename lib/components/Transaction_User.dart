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
      title: 'Conta 01',
      value: 1500.73,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta 02',
      value: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta 03',
      value: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta 04',
      value: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta 05',
      value: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta 06',
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
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
