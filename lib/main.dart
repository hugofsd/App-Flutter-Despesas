import './components/Transaction_User.dart';
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
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
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

              TransactionUser(),
            ],
          ),
        ));
  }
}
