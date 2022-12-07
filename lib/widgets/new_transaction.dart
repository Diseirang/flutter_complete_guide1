import 'package:flutter/material.dart';
import '../adaptives/elevated_button.dart';
import '../adaptives/flat_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {Key key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction Widget');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      titleController.text,
      enteredAmount,
      _selectedDate,
      // double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              left: 10,
              right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   //titleInput = value;
                // },
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) => _submitData(),
                //onChanged: (value) =>  amountInput = value,
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMMMEd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveTextButton(
                      text: 'Choose date',
                      handler: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              AdaptiveElevatedButton(
                text: 'Add Transaction',
                handle: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
