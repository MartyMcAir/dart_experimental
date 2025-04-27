import 'package:flutter/widgets.dart';

import 'summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryDate, {super.key});

  final List<Map<String, Object>> summaryDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryDate.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(), // map to list
        ),
      ),
    );
  }
}
