import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItems extends StatelessWidget {
  const TransactionItems({
    Key key,
    @required this.transaction ,
    @required this.deleteTx,
  }) : super(key: key);

  final  Transaction  transaction ;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${transaction  .amount}')),
          ),
        ),
        title: Text(
          transaction .title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction .date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: () => deleteTx(
                  transaction .id,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            : IconButton(
                onPressed: () => deleteTx(transaction .id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
