import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;
  
  const WelcomeScreen({super.key, required this.onStartQuiz});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Test your knowledge!',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 50),
            AppButton(
              text: 'Start Quiz',
              onPressed: onStartQuiz,
              width: 200,
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'View History',
              onPressed: () {
                // Will be implemented for bonus
              },
              width: 200,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}