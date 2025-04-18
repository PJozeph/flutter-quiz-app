import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chooseAnswer, this.restartQuiz ,{super.key});

  final List<String> chooseAnswer;
  final void Function() restartQuiz;

  

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chooseAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answer ${numberOfCorrectAnswers} out of ${numberOfTotalQuestions} questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text("List of answers and questions", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 201, 153, 251),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            Questionssummary(summaryData: summaryData),
            TextButton(onPressed: restartQuiz, child: const Text("Restart Quiz!")),
          ],
        ),
      ),
    );
  }
}
