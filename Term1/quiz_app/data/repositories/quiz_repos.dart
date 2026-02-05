import '../../domain/model/quiz.dart';

class QuizRepository {
  Future<Quiz> getQuiz() async {
    // Mock data - can be replaced with JSON file loading
    await Future.delayed(const Duration(milliseconds: 500));
    
    return Quiz(
      id: 1,
      questions: [
        Question(
          id: 1,
          question: 'What is the capital of France?',
          answerChoices: ['London', 'Berlin', 'Paris', 'Madrid'],
          correctChoice: 'Paris',
        ),
        Question(
          id: 2,
          question: 'Which planet is known as the Red Planet?',
          answerChoices: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
          correctChoice: 'Mars',
        ),
        Question(
          id: 3,
          question: 'What is 2 + 2?',
          answerChoices: ['3', '4', '5', '6'],
          correctChoice: '4',
        ),
      ],
    );
  }
}