import 'package:flutter/material.dart';
import 'package:flutter_template/quiz_app/domain/model/quiz.dart';
import 'package:flutter_template/quiz_app/ui/widgets/choice_button.dart';
import 'package:flutter_template/quiz_app/ui/widgets/progress_bar.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final int currentIndex;
  final int totalQuestions;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.currentIndex,
    required this.totalQuestions,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(
              current: currentIndex + 1,
              total: totalQuestions,
            ),
            const SizedBox(height: 20),
            
            Text(
              'Question ${currentIndex + 1} of $totalQuestions',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Text(
                question.question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            Expanded(
              child: ListView.builder(
                itemCount: question.answerChoices.length,
                itemBuilder: (context, index) {
                  final choice = question.answerChoices[index];
                  final isSelected = selectedAnswer == choice;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ChoiceButton(
                      choice: choice,
                      isSelected: isSelected,
                      onTap: () => onAnswerSelected(choice),
                    ),
                  );
                },
              ),
            ),
            
            if (selectedAnswer != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: const Text(
                  'Answer selected! Moving to next question...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade100),
                ),
                child: const Text(
                  'Select an answer to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}