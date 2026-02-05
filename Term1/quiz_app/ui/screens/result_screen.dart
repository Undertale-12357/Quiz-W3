import 'package:flutter/material.dart';
import 'package:flutter_template/quiz_app/domain/model/quiz.dart';
import 'package:flutter_template/quiz_app/domain/model/submission.dart';
import 'package:flutter_template/quiz_app/ui/widgets/app_button.dart';
import 'package:flutter_template/quiz_app/ui/widgets/score_display.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.submission,
    required this.quiz,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ScoreDisplay(
                score: submission.score,
                total: submission.totalQuestions,
                percentage: submission.percentage,
              ),
            ),
            const SizedBox(height: 30),
            
            _buildScoreMessage(context),
            const SizedBox(height: 30),
            
            const Text(
              'Detailed Results:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Expanded(
              child: ListView.separated(
                itemCount: quiz.questions.length,
                separatorBuilder: (context, index) => const Divider(height: 20),
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.answers.firstWhere(
                    (a) => a.questionId == question.id,
                    orElse: () => Answer(
                      id: -1,
                      questionId: question.id,
                      playerId: submission.playerId,
                      answer: '',
                      isCorrect: false,
                    ),
                  );
                  
                  return _buildResultItem(
                    question: question,
                    userAnswer: answer.answer,
                    isCorrect: answer.isCorrect,
                    index: index,
                  );
                },
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  text: 'Restart Quiz',
                  onPressed: onRestart,
                  width: 150,
                  color: Colors.green,
                ),
                AppButton(
                  text: 'View History',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('History feature coming soon!'),
                      ),
                    );
                  },
                  width: 150,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreMessage(BuildContext context) {
    final percentage = submission.percentage;
    String message;
    Color color;

    if (percentage >= 80) {
      message = 'Excellent! 🎉';
      color = Colors.green;
    } else if (percentage >= 60) {
      message = 'Good job! 👍';
      color = Colors.lightGreen;
    } else if (percentage >= 40) {
      message = 'Not bad! 🤔';
      color = Colors.orange;
    } else {
      message = 'Keep practicing! 📚';
      color = Colors.red;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You answered ${submission.score} out of ${submission.totalQuestions} questions correctly.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem({
    required Question question,
    required String userAnswer,
    required bool isCorrect,
    required int index,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. ${question.question}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 16),
              const SizedBox(width: 8),
              const Text(
                'Correct: ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: Text(
                  question.correctChoice,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
                size: 16,
              ),
              const SizedBox(width: 8),
              const Text(
                'Your Answer: ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Text(
                  userAnswer.isEmpty ? 'Not answered' : userAnswer,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}