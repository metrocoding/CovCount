import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChart extends StatelessWidget {
  final List<List<VaccinationChartData>> vaccinatedList;
  final String title;
  final List<String> locationNames;

  const LinearChart(
      {Key key, this.vaccinatedList, this.title, this.locationNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 500.0),
        child: SfCartesianChart(
          enableAxisAnimation: true,
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: title),
          enableSideBySideSeriesPlacement: true,
          legend: Legend(
              isVisible: true,
              alignment: ChartAlignment.near,
              position: LegendPosition.bottom,
              isResponsive: true,
              overflowMode: LegendItemOverflowMode.wrap,
              toggleSeriesVisibility: true),
          palette: [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.pink,
            Colors.purple,
            Colors.brown,
            Colors.orange,
            Colors.black87,
            Colors.blue.shade800,
            Colors.green.shade800
          ],
          tooltipBehavior: TooltipBehavior(enable: true),
          series: _generateLines(vaccinatedList),
        ),
      ),
    );
  }

  List<LineSeries<VaccinationChartData, String>> _generateLines(
      List<List<VaccinationChartData>> vaccinatedLists) {
    List<LineSeries<VaccinationChartData, String>> list = [];
    var i = 0;
    vaccinatedLists.forEach((vaccinatedList) {
      list.add(LineSeries<VaccinationChartData, String>(
          name: locationNames[i],
          dataSource: vaccinatedList,
          xValueMapper: (VaccinationChartData vax, _) => vax.date,
          yValueMapper: (VaccinationChartData vax, _) => vax.total,
          dataLabelSettings: DataLabelSettings(isVisible: false)));
      i++;
    });
    return list;
  }
}
