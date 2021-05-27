import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

//coloquei em statefull para ocorrer a mudança do componente
class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit; // submeter formulário

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate;

  _submitForm() {
    print('Dado salvo:' + _titleController.text);
    print('Dado salvo:' + _valueController.text);
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

// filtro de dado invalido
    if (title.isEmpty || value <= 0) {
      return; // sai da função
    }

    widget.onSubmit(
        title, value, _selectedDate); // acesso ao componente statefull
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(), //hj
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // futuro
      if (pickedDate == null) {
        print('Executado  dentro do then');
        return;
      }

      // setState utilizado para que o flutter entender q o dado foi auterado
      // e que a interface precisa refletir o valor
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _titleController, // setar valores para a string
              // onSubmitted: (_) => _submitForm(), //forçar função
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: _valueController, // setar valores para a string
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // teclado numerico
              // onSubmitted: (_) => _submitForm(), //forçar função
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    // expandir o componente
                    child: Text(
                      _selectedDate == null
                          ? 'Sem Data'
                          : 'Data: ${DateFormat('d/M/y').format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: _submitForm,
                  color: Colors.purple,
                  child: Text('Nova Transação'),
                  textColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
