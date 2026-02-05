import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType {
  food,
  travel,
  leisure,
  work,
}

const uuid = Uuid();

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category; // new field for icon

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  @override
  String toString() {
    return """
Id: $id,
Title: $title,
Amount: $amount,
Date: $date,
Category: $category
""";
  }
}
