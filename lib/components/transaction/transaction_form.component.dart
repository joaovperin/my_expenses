import 'package:flutter/material.dart';
import 'package:my_expenses/constants/app.constants.dart';
import 'package:my_expenses/utils/number-utils.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key key, this.onSubmit}) : super(key: key);

  final void Function(String, double) onSubmit;

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController valueCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: titleCtrl,
              onSubmitted: (_) => _onSubmit(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (${getCurrency()})',
              ),
              controller: valueCtrl,
              onSubmitted: (_) => _onSubmit(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  textColor: kAppSecondColor,
                  onPressed: _onSubmit,
                  child: Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    final String title = titleCtrl.text.trim();
    final double value = double.tryParse(valueCtrl.text.trim()) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit.call(title, value);
  }
}
