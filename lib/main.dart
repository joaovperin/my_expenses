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
        canvasColor: kAppPrimaryColor.withAlpha(100),
        backgroundColor: Colors.pink,
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
    );
  }
}
