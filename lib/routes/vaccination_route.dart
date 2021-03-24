import 'dart:collection';

import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/routes/vaccination_countries_route.dart';
import 'package:covid_count/widgets/vaccination/world_vaccination_header.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VaccinationRoute extends StatelessWidget {
  final LinkedHashMap<dynamic, List<Map<String, String>>> usGrouped;
  final List<Vaccination> vaccinatedList;

  const VaccinationRoute({Key key, this.usGrouped, this.vaccinatedList})
      : super(key: key);

  int get getVaccinationCount {
    int totalCount = 0;
    vaccinatedList.forEach((vaccination) {
      if (vaccination.country == 'World')
        totalCount += int.parse(
            vaccination.data[vaccination.data.length - 1].totalVaccinations);
    });
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 90,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(color: MyColors.background),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                WorldVaccinationHeader(vaccinationCount: getVaccinationCount),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VaccinationCountryRoute(
                            vaccinatedList: this.vaccinatedList,
                          ),
                        ),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                child:
                                    Image.asset('assets/images/worldwide.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'World detail',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              child: Image.asset(
                                  'assets/images/united-states.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'United State detail',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title:
                        ChartTitle(text: 'Vaccination reports (million dose)'),
                    enableSideBySideSeriesPlacement: true,
                    series: <LineSeries<VacHistory, String>>[
                      LineSeries<VacHistory, String>(
                          dataSource: VacHistory.makeList(this.vaccinatedList),
                          xValueMapper: (VacHistory vax, _) => vax.date,
                          yValueMapper: (VacHistory vax, _) => vax.total,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                    ],
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
