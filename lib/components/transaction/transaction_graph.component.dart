import 'package:flutter/material.dart';

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
        child: Text('Gráfico'),
      ),
    );
  }
}
