import 'package:flutter/material.dart';
import '../../data/expenses_data.dart';
import '../../domain/model/expense.dart';
import 'expense_item.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = expensesData;

  @override
  Widget build(BuildContext context) {

    if (_registeredExpenses.isEmpty)
    {
      return Center(
          child: Text("No expenses found. Start adding some!")
         );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: _registeredExpenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(_registeredExpenses[index]), 
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.all(15),
            ),
            onDismissed: (DismissDirection direction)
            {
              final deletedExpense = _registeredExpenses[index];
              _registeredExpenses.removeAt(index);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  content: Text('${deletedExpense.title} deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      _registeredExpenses.add(deletedExpense);
                    },
                  )
                ),
              );
            },
            child: ExpenseItem(expense: _registeredExpenses[index]),
            );
        }

      ),
    );
  }
}
