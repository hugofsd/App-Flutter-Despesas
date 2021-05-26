import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Set<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //tamanlho para scroll
      child: SingleChildScrollView(
        //scroll para rolagem
        child: Column(
          children: transactions.map((tr) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          tr.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold, //peso da fonte
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('d/M/y').format(tr.date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(), // to list para converter para uma lista
        ),
      ),
    );
  }
}