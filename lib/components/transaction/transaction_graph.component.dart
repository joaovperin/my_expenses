import 'package:flutter/material.dart';

class TransactionGraph extends StatelessWidget {
  const TransactionGraph({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Card(
        child: Text('Gráfico'),
        elevation: 5,
      ),
    );
  }
}
