import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChart extends StatelessWidget {
  final List<VaccinationChartData> vaccinatedList;
  final String title;

  const LinearChart({Key key, this.vaccinatedList, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: title),
        enableSideBySideSeriesPlacement: true,
        series: <LineSeries<VaccinationChartData, String>>[
          LineSeries<VaccinationChartData, String>(
              dataSource: vaccinatedList,
              xValueMapper: (VaccinationChartData vax, _) => vax.date,
              yValueMapper: (VaccinationChartData vax, _) => vax.total,
              dataLabelSettings: DataLabelSettings(isVisible: false)),
        ],
      ),
    );
  }
}
