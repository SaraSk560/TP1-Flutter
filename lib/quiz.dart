import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;
  final quiz = [
    {
      'title': 'Question 1',
      'answers': [
        {'answer': 'Answer 11', 'correct': false},
        {'answer': 'Answer 12', 'correct': false},
        {'answer': 'Answer 13', 'correct': true},
      ]
    },
    {
      'title': 'Question 2',
      'answers': [
        {'answer': 'Answer 21', 'correct': false},
        {'answer': 'Answer 22', 'correct': true},
        {'answer': 'Answer 23', 'correct': false},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.orange,
      ),
      body: (currentQuestion >= quiz.length)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Score: ${(score / quiz.length * 100).round()} %',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 22,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        currentQuestion = 0;
                        score = 0;
                      });
                    },
                    child: Text(
                      'Restart ...',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    quiz[currentQuestion]['title'] as String,
                    style: TextStyle(fontSize: 24),
                  ),
                  ...(quiz[currentQuestion]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          if (answer['correct'] as bool) {
                            score++;
                          }
                          currentQuestion++;
                        });
                      },
                      child: Text(
                        answer['answer'] as String,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
    );
  }
}
