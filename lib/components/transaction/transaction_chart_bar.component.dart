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
        Text(getCurrency()),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[300], //TODO: fix color
            borderRadius: _buildBorderRadius(),
          ),
          height: kContainerSize,
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100], //TODO: fix color
                borderRadius: _buildBorderRadius(),
              ),
              child: SizedBox(width: 16, height: calcItemHeight()),
            ),
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.vertical(top: Radius.circular(6));

  double calcItemHeight() => kContainerSize - ((kContainerSize * percentage) / 100);
}
