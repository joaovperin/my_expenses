import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_expenses/components/transaction/transaction_form.component.dart';
import 'package:my_expenses/components/transaction/transaction_list.component.dart';
import 'package:my_expenses/models/transaction.model.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _transactions = <Transaction>[
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double value) {
    final Transaction newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() => _transactions.add(newTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(onSubmit: _addTransaction),
      ],
    );
  }
}
