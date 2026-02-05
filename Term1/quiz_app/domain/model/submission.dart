class Submission {
  final int id;
  final int playerId;
  final int quizId;
  final List<Answer> answers;
  final DateTime date;
  final int score;
  final int totalQuestions;
  
  Submission({
    required this.id,
    required this.playerId,
    required this.quizId,
    required this.answers,
    required this.date,
    required this.score,
    required this.totalQuestions,
  });
  
  // Calculated property
  double get percentage => totalQuestions > 0 
      ? (score / totalQuestions) * 100 
      : 0;
  
  // JSON Serialization
  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      id: json['id'] as int,
      playerId: json['playerId'] as int,
      quizId: json['quizId'] as int,
      score: json['score'] as int,
      totalQuestions: json['totalQuestions'] as int,
      date: DateTime.parse(json['date'] as String),
      answers: (json['answers'] as List)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerId': playerId,
      'quizId': quizId,
      'score': score,
      'totalQuestions': totalQuestions,
      'date': date.toIso8601String(),
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
  
  @override
  String toString() {
    return 'Submission{id: $id, playerId: $playerId, score: $score/$totalQuestions (${percentage.toStringAsFixed(1)}%)}';
  }
}

class Answer {
  final int id;
  final int questionId;
  final int playerId;
  final String answer;
  final bool isCorrect;
  
  Answer({
    required this.id,
    required this.questionId,
    required this.playerId,
    required this.answer,
    required this.isCorrect,
  });
  
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as int,
      questionId: json['questionId'] as int,
      playerId: json['playerId'] as int,
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'playerId': playerId,
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
  
  @override
  String toString() {
    return 'Answer{questionId: $questionId, answer: "$answer", isCorrect: $isCorrect}';
  }
}