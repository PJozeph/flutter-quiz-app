import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/question_counter.dart';
import 'package:quiz_app/question_summary/user_answer.dart';

class Questionssummary extends StatelessWidget {
  const Questionssummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QuestionCounter(
                          (data['question_index'] as int),
                          data['user_answer'] as String ==
                              data['correct_answer'] as String,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['question'] as String,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 201, 153, 251),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            UserAnswer(
                              data['user_answer'] as String,
                              data['user_answer'] as String ==
                                  data['correct_answer'] as String,
                            ),
                            Text(data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 251, 153, 251),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
