import 'package:flutter/foundation.dart'; // para usar o requerido, decoretor

class Transaction {
  final String id;
  final String title;
  final double value; //valor
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.date,
      @required this.value});
}
