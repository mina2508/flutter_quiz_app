import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> questionsSummaryList;
  const QuestionsSummary({super.key, required this.questionsSummaryList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...questionsSummaryList.map((data) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (data['user_answer'] == data['correct_answer'])
                            ? const Color.fromARGB(255, 79, 166, 238)
                            : const Color.fromARGB(255, 255, 100, 152),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['user_answer'].toString(),
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 237, 156, 243),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['correct_answer'].toString(),
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 79, 166, 238),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
