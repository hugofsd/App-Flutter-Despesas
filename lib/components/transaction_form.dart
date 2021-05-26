import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit; // submeter formulário

  TransactionForm(this.onSubmit);

//pesquisar
  _submitForm() {
    print('Dado salvo:' + titleController.text);
    print('Dado salvo:' + valueController.text);
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

// filtro de dado invalido
    if (title.isEmpty || value <= 0) {
      return; // sai da função
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController, // setar valores para a string
              // onSubmitted: (_) => _submitForm(), //forçar função
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController, // setar valores para a string
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // teclado numerico
              // onSubmitted: (_) => _submitForm(), //forçar função
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: _submitForm,
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
