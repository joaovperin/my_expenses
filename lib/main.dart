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
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: kAppPrimaryColor
              ),
            ),
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
    Transaction(
      id: 't3',
      title: 'Cartão de crédito',
      value: 930.62,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't4',
      title: 'Xizão',
      value: 17.90,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't5',
      title: 'Açaí',
      value: 12.00,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  void _addTransaction(String title, double value, DateTime dateTime) {
    final Transaction newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dateTime,
    );
    setState(() => _transactions.add(newTransaction));
    Navigator.of(context).pop();
  }

  void _removeTransaction(Transaction tr) {
    setState(() => _transactions.remove(tr));
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
            onItemDismiss: _removeTransaction,
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
