import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titileControler = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransactionHolder;

  NewTransaction({this.addNewTransactionHolder});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titileControler,
              //onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              onPressed: () => addNewTransactionHolder(
                titileControler.text,
                int.parse(amountController.text),
              ),
              textColor: Colors.purple,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
