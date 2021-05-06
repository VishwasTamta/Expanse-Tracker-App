import 'package:flutter/material.dart';

import './transactions_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Book',
      amount: 399,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Chair',
      amount: 20000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txtitle, int txamount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransactionHolder: _addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
