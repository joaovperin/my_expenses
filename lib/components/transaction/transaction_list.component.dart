import 'package:flutter/material.dart';
import 'package:my_expenses/models/transaction.model.dart';
import 'package:my_expenses/utils/date-utils.dart';
import 'package:my_expenses/utils/number-utils.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key key, this.onItemDismiss}) : super(key: key);

  final void Function(Transaction) onItemDismiss;

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: transactions.isEmpty ? _buildEmptyListWidget(context) : _buildListView(),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final Transaction tr = transactions[index];
        return Dismissible(
          key: Key(tr.id),
          onDismissed: (DismissDirection direction) => onItemDismiss.call(tr),
          child: Card(
            child: ListTile(
              leading: Container(
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
              title: Text(
                tr.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).shadowColor,
                ),
              ),
              subtitle: Text(
                fmtDateTime(tr.date),
                style: TextStyle(color: Theme.of(context).unselectedWidgetColor),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => onItemDismiss.call(tr),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildEmptyListWidget(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20),
      SizedBox(
        height: 120,
        child: Image.asset(
          'assets/images/waiting.png',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Nenhuma transação cadastrada!',
        style: Theme.of(context).textTheme.headline6,
      ),
    ]);
  }
}
