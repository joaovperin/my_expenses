import 'package:flutter/material.dart';
import 'package:my_expenses/constants/app.constants.dart';
import 'package:my_expenses/models/transaction.model.dart';
import 'package:my_expenses/utils/date-utils.dart';
import 'package:my_expenses/utils/number-utils.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key key}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        children: transactions.map((Transaction tr) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: kAppPrimaryColor,
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    fmtMoney(tr.value),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      fmtDateTime(tr.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
