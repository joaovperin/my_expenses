import 'package:flutter/material.dart';
import 'package:my_expenses/models/transaction.model.dart';
import 'package:my_expenses/utils/date-utils.dart';

import 'transaction_chart_bar.component.dart';

class TransactionChart extends StatefulWidget {
  const TransactionChart(this.transactions, {Key key}) : super(key: key);

  final List<Transaction> transactions;

  @override
  _TransactionChartState createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  List<TransactionChartBar> get groupedTransactions {
    double allElementsSum = 0.000;

    final List<Map<String, Object>> list = List<Map<String, Object>>.generate(7, (int index) {
      final DateTime weekDay = DateTime.now().subtract(
        Duration(days: 6 - index),
      );
      final List<Transaction> recentTransactions = widget.transactions
          .where((Transaction tr) => tr.date.isAfter(DateTime.now().subtract(Duration(days: 8))))
          .where((Transaction tr) => tr.date.day == weekDay.day)
          .toList();
      // Calculate the sum
      final double totalSum = recentTransactions.isEmpty
          ? 0
          : recentTransactions.map((Transaction tr) => tr.value).reduce((double value, double element) => value + element);

      allElementsSum += totalSum;
      return <String, Object>{
        'day': fmtWeekDayLetter(weekDay),
        'value': totalSum,
      };
    });

    return list.map((Map<String, Object> e) {
      final String dayOfWeek = e['day'].toString();
      final double value = double.tryParse(e['value'].toString()) ?? 0;
      final double percentage = allElementsSum > 0 ? ((value / allElementsSum) * 100) : 0;
      return TransactionChartBar(label: dayOfWeek, value: value, percentage: percentage);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                'Gráfico',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
            ),
            Card(
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: groupedTransactions,
              ),
            )
          ],
        ),
      ),
    );
  }
}
