import 'package:flutter/material.dart';

class QuestionCounter extends StatelessWidget {
  const QuestionCounter(this.questionIndex, this.isCorrectAnswer, {super.key});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCorrectAnswer ? Colors.lightGreen : Colors.redAccent,
            ),
            child: Center(
              child: Text(
                (questionIndex + 1).toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
