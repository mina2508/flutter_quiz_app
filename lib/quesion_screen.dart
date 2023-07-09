import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesionScreen extends StatefulWidget {
  final void Function(String answer) onChooseAnswer;
  const QuesionScreen({super.key, required this.onChooseAnswer});
  @override
  State<QuesionScreen> createState() {
    return _QuesionScreenState();
  }
}

class _QuesionScreenState extends State<QuesionScreen> {
  var currentQuestionIndex = 0;

  void tapAnswer(String answer) {
    widget.onChooseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 239, 207, 247),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffledList.map((answer) => AnswerButton(
                  answerText: answer,
                  clickAnswer: () {
                    tapAnswer(answer);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
