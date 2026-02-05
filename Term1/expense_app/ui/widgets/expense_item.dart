import 'package:flutter/material.dart';
import '../../domain/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key, required this.expense
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(expense.title),
              Text(expense.amount.toString()),
            ],
          ),
          Row(
            children: [
              // Icon(expense.icon),
              Text(expense.date.year.toString() + '-' + expense.date.month.toString() + "-" + expense.date.day.toString()),
            ],
          )
        ],
      ),
    );
  }
}

