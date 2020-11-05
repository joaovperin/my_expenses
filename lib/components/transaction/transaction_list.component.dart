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
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final Transaction tr = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    fmtMoney(tr.value),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
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
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                    Text(
                      fmtDateTime(tr.date),
                      style: TextStyle(color: Theme.of(context).unselectedWidgetColor),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
