import 'package:flutter/material.dart';
import 'package:my_expenses/utils/number-utils.dart';

class TransactionChartBar extends StatelessWidget {
  const TransactionChartBar({Key key, this.label, this.value, this.percentage}) : super(key: key);

  static const double kContainerSize = 74;

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 18,
          child: FittedBox(
            child: Text(getCurrency()),
          ),
        ),
        SizedBox(height: 4),
        Tooltip(
          message: fmtMoney(value),
          child: SizedBox(
            height: kContainerSize,
            width: 16,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100], //TODO: fix color
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage / 100,
                  widthFactor: .9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple[300], //TODO: fix color
                    ),
                  ),
                ),
                Container(
                  height: 2,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
