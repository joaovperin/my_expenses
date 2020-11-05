import 'package:flutter/material.dart';
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
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: titleCtrl,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Valor (${getCurrency()})',
              ),
              controller: valueCtrl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  textColor: Colors.purple,
                  onPressed: () {
                    print("Title: ${titleCtrl.text} and Value ${fmtMoney(double.parse(valueCtrl.text))}");
                    // Callback
                    onSubmit.call(titleCtrl.text.trim(), double.tryParse(valueCtrl.text.trim()) ?? 0);
                  },
                  child: Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
