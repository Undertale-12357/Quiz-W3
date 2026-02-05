import 'package:flutter/material.dart';
import '../domain/model/expense.dart';

final List<Expense> expensesData = [
  Expense(
    title: 'Lunch at Cafe',
    amount: 12.50,
    date: DateTime(2025, 12, 1),
    category: ExpenseType.food,
  ),
  Expense(
    title: 'Bus Ticket',
    amount: 3.25,
    date: DateTime(2025, 12, 1),
    category: ExpenseType.travel
  ),
  Expense(
    title: 'Movie Night',
    amount: 15.00,
    date: DateTime(2025, 11, 30),
    category: ExpenseType.leisure
  ),
  Expense(
    title: 'Office Supplies',
    amount: 45.75,
    date: DateTime(2025, 11, 28),
    category: ExpenseType.work
  ),
  Expense(
    title: 'Dinner with Friends',
    amount: 28.40,
    date: DateTime(2025, 12, 1),
    category: ExpenseType.leisure
  ),
];
