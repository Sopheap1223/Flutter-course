

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController Amount = TextEditingController();


  void onPressed(){
    String title = _titleController.text;
    double amount = double.parse(Amount.text);
    print("title = $title , Price = $amount");
  }
  @override
  void dispose(){
    // Dispose the controler
    _titleController.dispose();
    Amount.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            inputFormatters:[FilteringTextInputFormatter.digitsOnly],
            controller: Amount,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text('price'),
               prefix: Text('\$ '),
            ),
          ),
          ElevatedButton(onPressed: onPressed, child: Text("Print Value"))
        ],
      ),
    );
  }
}
