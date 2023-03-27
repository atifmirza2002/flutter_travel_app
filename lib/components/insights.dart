import 'package:flutter/material.dart';
import '../constants/data.dart';
import './insights_card.dart';
class Insights extends StatefulWidget {
  final Map<String ,dynamic> insights;
  const Insights({Key? key, required this.insights}) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: insightsData.map((item) => InsightsCard(insights: item)).toList(),
      ),
    );
  }
}
