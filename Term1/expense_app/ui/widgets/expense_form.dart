import 'package:flutter/material.dart';
import 'package:flutter_template/expense_app/data/expenses_data.dart';
import 'package:provider/provider.dart';

import '../../domain/model/expense.dart';
import 'package:uuid/uuid.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _selectedDate;
  ExpenseType _selectedCategory = ExpenseType.leisure;

  void onCreate() {
    final enteredAmount = double.tryParse(_amountControler.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleControler.text.trim().isEmpty ||
        amountIsInvalid ) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid title, amount, date, and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    Expense newExpense = Expense(
      title: _titleControler.text,
      amount: double.parse(_amountControler.text),
      date: _selectedDate!,
      category: _selectedCategory,
    );

    expensesData.add(newExpense);
 
    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancel()
  {
    Navigator.pop(context);
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }


  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleControler,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("Amount"), prefixText: '\$'),
                ),
              ),
                const SizedBox(width: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: <Widget> [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                    IconButton(
                      onPressed: _selectDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(width: 16),
          Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<ExpenseType>(
                value: _selectedCategory,
                style: const TextStyle(color: Colors.black),
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                underline: Container(height: 2, color: Colors.blue,),
                items: ExpenseType.values.map((ExpenseType value) {
                  return DropdownMenuItem<ExpenseType>(value: value, child: Text(value.name.toUpperCase()));
                }).toList(), 
                onChanged: (ExpenseType? newValue) {
                  if (newValue != null){
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  }
                }
              ),
              SizedBox(width: 300,),
              ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
              SizedBox(width: 24,),
              ElevatedButton(onPressed: onCreate, child: Text("Create")),
            ],
          )
          )
        ],
      ),
    );
  }
}