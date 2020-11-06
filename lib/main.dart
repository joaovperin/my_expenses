import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/components/transaction/transaction_form.component.dart';
import 'package:my_expenses/constants/app.constants.dart';

import 'components/transaction/transaction_chart.component.dart';
import 'components/transaction/transaction_list.component.dart';
import 'models/transaction.model.dart';

dynamic main() async {
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting();
  runApp(MyExpensesApp());
}

class MyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: MaterialColor(
          kAppPrimaryColor.value,
          const <int, Color>{
            50: kAppPrimaryColor,
            100: kAppPrimaryColor,
            200: kAppPrimaryColor,
            300: kAppPrimaryColor,
            400: kAppPrimaryColor,
            500: kAppPrimaryColor,
            600: kAppPrimaryColor,
            700: kAppPrimaryColor,
            800: kAppPrimaryColor,
            900: kAppPrimaryColor,
          },
        ),
        canvasColor: kAppBackgroundColor,
        fontFamily: 'Quicksand',
        backgroundColor: kAppBackgroundColor,
        accentColor: kAppAccentColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kAppAccentColor,
          foregroundColor: kAppBackgroundColor,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = <Transaction>[
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
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
    Navigator.of(context).pop();
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: kAppPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TransactionChart(_transactions),
          TransactionList(
            _transactions,
            onItemDismiss: (Transaction tr) {
              setState(() => _transactions.remove(tr));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
