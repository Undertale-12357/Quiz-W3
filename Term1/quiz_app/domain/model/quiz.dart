class Quiz {
  final int id;
  final String? title;
  final List<Question> questions;
  
  Quiz({
    required this.id,
    this.title,
    required this.questions,
  });
  
  // Add fromJson factory constructor
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
  
  // Add toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final int id;
  final String question;
  final List<String> answerChoices;
  final String correctChoice;
  
  Question({
    required this.id,
    required this.question,
    required this.answerChoices,
    required this.correctChoice,
  });
  
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answerChoices: (json['answerChoices'] as List).cast<String>(),
      correctChoice: json['correctChoice'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answerChoices': answerChoices,
      'correctChoice': correctChoice,
    };
  }
}