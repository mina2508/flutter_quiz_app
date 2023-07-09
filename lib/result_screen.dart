import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> choosenAnswers;
  final void Function() onRetest;
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onRetest});
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final questionTotalNumber = questions.length;
    final correctAnswersNumber = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctAnswersNumber out of $questionTotalNumber questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 230, 205, 236),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              questionsSummaryList: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRetest,
                icon: const Icon(
                  Icons.refresh,
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: const Text(
                  "Restart Quiz",
                ))
          ],
        ),
      ),
    );
  }
}
