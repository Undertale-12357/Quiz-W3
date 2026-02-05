import 'package:flutter/material.dart';
import 'package:flutter_template/quiz_app/data/repositories/quiz_repos.dart';
import 'package:flutter_template/quiz_app/domain/model/quiz.dart';
import 'package:flutter_template/quiz_app/domain/model/submission.dart';
import 'package:flutter_template/quiz_app/ui/screens/welcome_screen.dart';
import 'package:flutter_template/quiz_app/ui/screens/question_screen.dart';
import 'package:flutter_template/quiz_app/ui/screens/result_screen.dart';

enum ScreenType { welcome, quiz, result }

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late Quiz _quiz;
  ScreenType _currentScreen = ScreenType.welcome;
  int _currentQuestionIndex = 0;
  Map<int, String> _answers = {};
  Submission? _submission;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  void _loadQuiz() async {
    final repository = QuizRepository();
    _quiz = await repository.getQuiz();
  }

  void _startQuiz() {
    setState(() {
      _currentScreen = ScreenType.quiz;
      _currentQuestionIndex = 0;
      _answers = {};
    });
  }

  void _selectAnswer(String answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
      
      if (_currentQuestionIndex < _quiz.questions.length - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _currentQuestionIndex++;
          });
        });
      } else {
        _calculateResults();
      }
    });
  }

  void _calculateResults() {
    int score = 0;
    final answers = <Answer>[];
    
    for (int i = 0; i < _quiz.questions.length; i++) {
      final question = _quiz.questions[i];
      final userAnswer = _answers[i] ?? '';
      final isCorrect = userAnswer == question.correctChoice;
      
      if (isCorrect) score++;
      
      answers.add(Answer(
        id: i,
        questionId: question.id,
        playerId: 1,
        answer: userAnswer,
        isCorrect: isCorrect,
      ));
    }
    
    final submission = Submission(
      id: DateTime.now().millisecondsSinceEpoch,
      playerId: 1,
      quizId: _quiz.id,
      answers: answers,
      date: DateTime.now(),
      score: score,
      totalQuestions: _quiz.questions.length,
    );
    
    setState(() {
      _submission = submission;
      _currentScreen = ScreenType.result;
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentScreen = ScreenType.welcome;
      _currentQuestionIndex = 0;
      _answers = {};
      _submission = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case ScreenType.welcome:
        return WelcomeScreen(
          onStartQuiz: _startQuiz,
        );
      case ScreenType.quiz:
        if (_quiz.questions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return QuestionScreen(
          question: _quiz.questions[_currentQuestionIndex],
          currentIndex: _currentQuestionIndex,
          totalQuestions: _quiz.questions.length,
          selectedAnswer: _answers[_currentQuestionIndex],
          onAnswerSelected: _selectAnswer,
        );
      case ScreenType.result:
        if (_submission == null) return const SizedBox();
        return ResultScreen(
          submission: _submission!,
          quiz: _quiz,
          onRestart: _restartQuiz,
        );
    }
  }
}