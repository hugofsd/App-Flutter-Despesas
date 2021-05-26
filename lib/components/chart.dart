import 'dart:core';

import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //transação recente, var
  final List<Transaction> recentTransaction;

// construtor para o char receber as transações
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    // 7 elementos dp char
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index), //subtração de forma dinamica
      );

      // soma total
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i]
              .value; //soma total é acrescetando(atribuição aditiva) a recente transação
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      // DateFormat.E().format(weekDay).[0]  formatação do dia
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
