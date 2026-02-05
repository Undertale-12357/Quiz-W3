import 'package:flutter/material.dart';
import 'package:flutter_template/expense_app/ui/widgets/expense_form.dart';
import 'package:flutter_template/expense_app/ui/widgets/expenses.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  void onAddClicked(BuildContext context) {
  
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => ExpenseForm()
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.blue[100],
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => onAddClicked(context),
                icon: const Icon(Icons.add),
              ),
            ],
            backgroundColor: Colors.blue[700],
            title: const Text('Ronan-The-Best Expenses App'),
          ),
          body: const Expenses(),
        ),
      ),
    );
  }

}
