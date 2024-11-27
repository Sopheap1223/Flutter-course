import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';
import 'expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}
class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final icon = {
      ExpenseType.food: Icons.fastfood,
      ExpenseType.travel: Icons.flight,
      ExpenseType.leisure: Icons.movie,
      ExpenseType.work: Icons.work,
    }[expense.type];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Title and Amount Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(), // Spacer to push content apart
            // Icon and Date Row
            Row(
              children: [
                Icon(icon, size: 24, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  DateFormat.yMd().format(expense.date),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "book",
      type: ExpenseType.leisure,
      amount: 12,
      date: DateTime.now(),
    ),
    Expense(
      title: "milk",
      type: ExpenseType.food,
      amount: 1.5,
      date: DateTime.now(),
    ),
    Expense(
      title: "lock lack",
      type: ExpenseType.food,
      amount: 2,
      date: DateTime.now(),
    ),
  ];

  void onAddClicked() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Expense Modal",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close the modal
                },
                child: const Text("Close Modal"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onAddClicked, // Link to the onAddClicked method
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ListView.builder(itemCount: _registeredExpenses.length,
      itemBuilder: (context, index){
        return ExpenseItem(expense:_registeredExpenses[index]);
      })
    );
  }
}
