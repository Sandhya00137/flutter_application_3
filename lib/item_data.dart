import 'package:flutter/material.dart';
import 'package:flutter_application_3/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemData extends StatelessWidget {
  const ItemData(this.summaryItemData, {super.key});

  final Map<String, Object> summaryItemData;

  @override
  Widget build(BuildContext context) {

    final isCorrectAnswer =
        summaryItemData['choosenAnswer'] == summaryItemData['correctAnswer'];

     return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: summaryItemData['questionIndex'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryItemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(summaryItemData['choosenAnswer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    )),
                Text(summaryItemData['correctAnswer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}