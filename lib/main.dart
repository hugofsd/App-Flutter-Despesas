import 'package:despesas/components/transaction_form.dart';

import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';

import './models/transaction.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//função para abrir modal
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    //fechar modal
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
        backgroundColor: Colors.purple,
      ),
      // habilitar rolagem

      body: SingleChildScrollView(
        child: Column(
          //COLUNA
          //linha
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //lista
          children: <Widget>[
            //ctrl+. no card
            Container(
              //width: double.infinity, largura
              child: Card(
                //filho
                child: Text('Gráfico'),
                elevation: 7,
              ),
            ),
            // mapeando objetos para a tela
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // centralizar o botão
    );
  }
}
  