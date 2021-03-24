import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VaccinationCountryHistoryRoute extends StatelessWidget {
  final Vaccination vaccinateDetail;

  const VaccinationCountryHistoryRoute({Key key, this.vaccinateDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: MyColors.background),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: MyColors.hotGreen),
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CustomBackButton(),
                      Text(
                        '${this.vaccinateDetail.country}',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height - 251,
                  child: Container(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(
                          text: 'Vaccination reports (million dose)'),
                      enableSideBySideSeriesPlacement: true,
                      series: <LineSeries<VacHistory, String>>[
                        LineSeries<VacHistory, String>(
                            dataSource: VacHistory.makeListVaccine(
                                this.vaccinateDetail),
                            xValueMapper: (VacHistory vax, _) => vax.date,
                            yValueMapper: (VacHistory vax, _) => vax.total,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
