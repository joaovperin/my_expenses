import 'package:flutter/material.dart';
import 'package:my_expenses/utils/number-utils.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key key}) : super(key: key);

  final titleCtrl = TextEditingController();
  final valueCtrl = TextEditingController();

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
              decoration:
                  InputDecoration(labelText: "Valor (${getCurrency()})"),
              controller: valueCtrl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    print(
                        "Title: ${titleCtrl.text} and Value ${fmtMoney(double.parse(valueCtrl.text))}");
                    // _transactions.add(Transaction(
                    //   id: 'new',
                    //   title: titleCtrl.text.trim(),
                    //   value: double.parse(valueCtrl.text.trim()),
                    //   date: DateTime.now(),
                    // ));
                    // print("Title: ${titleCtrl.text} and Value ${fmtMoney(double.parse(valueCtrl.text))}");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
