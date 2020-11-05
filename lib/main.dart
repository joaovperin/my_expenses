import 'package:flutter/material.dart';
import 'package:my_expenses/constants/app.constants.dart';

import 'components/transaction/transaction_graph.component.dart';
import 'components/transaction/transaction_user.component.dart';

dynamic main() {
  runApp(MyExpensesApp());
}

class MyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        canvasColor: kAppBackgroundColor,
        backgroundColor: kAppBackgroundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kAppSecondColor,
          foregroundColor: kAppBackgroundColor,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: kAppPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            TransactionGraph(),
            TransactionUser(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
