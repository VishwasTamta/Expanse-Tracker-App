import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactinos;
  final Function _deleteTransaction;

  TransactionList(this.transactinos, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactinos.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactinos.length,
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('Rs.${transactinos[index].amount}/-')),
                    ),
                  ),
                  title: Text(
                    transactinos[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(transactinos[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => _deleteTransaction(transactinos[index].id),
                  ),
                ),
              );
            },
          );
  }
}
