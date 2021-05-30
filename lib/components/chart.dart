import 'dart:core';
import '../components/chart_bar.dart';
import 'package:despesas/components/chart_bar.dart';
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
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i]
              .value; //soma total é acrescetando(atribuição aditiva) a recente transação
        }
      }

      // DateFormat.E().format(weekDay).[0]  formatação do dia
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
    //reversed para reverter os elementos
  }

//soma da semana
  double get _weekTotalValue {
    //receber o sum(acumulador) e item(tr)
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight, // dividir os elementos de forma igual
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                percentage: (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
