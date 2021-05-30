import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Set<Transaction> transactions;

  final void Function(String) onRemove; //função importada do manis

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // lista para scroll q precisa de um pai com tamanho
      children: transactions.map((tr) {
        return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('R\$ ${tr.value}'),
                    )),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat('d MMM y').format(tr.date)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onRemove(tr.id), // func passando o parametro
                color: Theme.of(context).errorColor,
              ),
            ));
      }).toList(), // to list para converter para uma lista
    );
  }
}
