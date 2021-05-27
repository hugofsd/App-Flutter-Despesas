import 'package:despesas/components/chart.dart';
import 'package:despesas/components/transaction_form.dart';

import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';

import './components/chart.dart';

import './models/transaction.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
              ))),
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
      title: 'Conta de Luz',
      value: 100.0,
      date: DateTime.now().subtract(Duration(days: 3)), // 3 dias atrás
    ),
    Transaction(
        id: 't2',
        title: 'Celular',
        value: 1500.0,
        date: DateTime.now().subtract(Duration(days: 4)) // 4 dias atrás
        ),
    Transaction(
        id: 't3',
        title: 'Investimento em CDB',
        value: 10.0,
        date: DateTime.now().subtract(Duration(days: 4)) // 4 dias atrás
        ),
  };

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7), // pegar a data atual e subtrair 7 dias
      ));
    }).toList(); //to list para n numerar e ter um padrão de lista
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random()
            .nextDouble()
            .toString(), //converte o valor randomicamente para double e depois para string de id unico
        title: title,
        date: date,
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
        title: Text('Despesas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
        // backgroundColor: Colors.purple,
      ),
      // habilitar rolagem

      body: SingleChildScrollView(
        child: Column(
          //COLUNA
          //linha
          crossAxisAlignment: CrossAxisAlignment.stretch, // epandir linha
          //lista
          children: <Widget>[
            //ctrl+. no card
            Chart(_recentTransactions),
            // mapeando objetos para a tela
            TransactionList(_transactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Colors.purple,
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // centralizar o botão
    );
  }
}
