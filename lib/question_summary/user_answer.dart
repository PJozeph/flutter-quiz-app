import 'package:flutter/material.dart';

class UserAnswer extends StatelessWidget {
  const UserAnswer(this.userAnswer, this.isCorrectAnswer, {super.key});

  final String userAnswer;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Text(
      userAnswer,
      style: TextStyle(
        color: isCorrectAnswer ? Colors.lightGreen : Colors.redAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
