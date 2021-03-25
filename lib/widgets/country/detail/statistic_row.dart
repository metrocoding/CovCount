import 'package:flutter/material.dart';

class StatisticRow extends StatelessWidget {
  final String text;
  final String value;
  final Color color;

  const StatisticRow({Key key, this.text, this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle lightTextStatistic = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54);
    TextStyle numeriStatistics = TextStyle(
        fontSize: 16,
        color: color != null ? color : Colors.pink.shade400,
        fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            '$text',
            textAlign: TextAlign.right,
            style: lightTextStatistic,
          ),
          Text(
            value == 'N/A' ? ' Not reported' : ' $value',
            textAlign: TextAlign.left,
            style: numeriStatistics,
          ),
        ],
      ),
    );
  }
}
