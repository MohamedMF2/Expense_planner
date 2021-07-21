import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class NewTranaction extends StatefulWidget {
  final Function addTransaction;

  NewTranaction(this.addTransaction);

  @override
  _NewTranactionState createState() => _NewTranactionState();
}

class _NewTranactionState extends State<NewTranaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(
      title: enteredTitle,
      amount: enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            OutlinedButton(
              child: Text('add transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
