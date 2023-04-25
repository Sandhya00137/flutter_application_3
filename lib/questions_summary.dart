import 'package:flutter/material.dart';
import 'package:flutter_application_3/item_data.dart';


class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return ItemData(data);
          }).toList(),
        ),
      ),
    );
  }
}
