import 'package:flutter/material.dart';
import 'package:my_expenses/constants/app.constants.dart';

class TransactionGraph extends StatelessWidget {
  const TransactionGraph({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Gráfico',
            style: TextStyle(
              fontSize: 30,
              color: kAppUnfocusedTextColor
            ),
          ),
        ),
      ),
    );
  }
}
