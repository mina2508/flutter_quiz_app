import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() clickAnswer;
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.clickAnswer,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 167, 27, 199),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
      ),
      onPressed: clickAnswer,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
