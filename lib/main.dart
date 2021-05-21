import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          //COLUNA
          mainAxisAlignment: MainAxisAlignment.spaceAround,

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
            Card(
              child: Text('Lista de Transferencia'),
              elevation: 7,
            )
          ],
        ));
  }
}
