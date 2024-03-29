import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/utility/util.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:covid_count/widgets/country/detail/statistic_row.dart';
import 'package:covid_count/widgets/country/detail/white_box.dart';
import 'package:covid_count/widgets/country/detail/white_box_title.dart';
import 'package:covid_count/widgets/linear_chart.dart';
import 'package:flutter/material.dart';

class VaccinationCountryHistoryRoute extends StatelessWidget {
  final Vaccination vaccinateDetail;

  const VaccinationCountryHistoryRoute({Key key, this.vaccinateDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: MyColors.background),
        child: SingleChildScrollView(
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 10) Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            MyColors.lightGreen,
                            MyColors.hotGreen,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          CustomBackButton(this.vaccinateDetail.location),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LinearChart(
                      title: 'Vaccination reports (million dose)',
                      vaccinatedList: [
                        VaccinationChartData.makeListVaccine(
                            this.vaccinateDetail)
                      ],
                      locationNames: [vaccinateDetail.location],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WhiteBox(
                      children: [
                        BoxTitle(title: ' Latest Statistics'),
                        StatisticRow(
                          text: 'Fully Vaccinated: ',
                          color: MyColors.hotGreen,
                          value:
                              '${Util.toNumericFormat(this.vaccinateDetail.data.last.peopleFullyVaccinated)} - ${this.vaccinateDetail.data.last.peopleFullyVaccinatedPerHundred}%',
                        ),
                        StatisticRow(
                          text: 'Vaccinated: ',
                          color: MyColors.hotGreen,
                          value:
                              '${Util.toNumericFormat(this.vaccinateDetail.data.last.peopleVaccinated)} - ${this.vaccinateDetail.data.last.peopleVaccinatedPerHundred}%',
                        ),
                        StatisticRow(
                          text: 'Total Vaccinated: ',
                          color: MyColors.hotGreen,
                          value:
                              '${Util.toNumericFormat(this.vaccinateDetail.data.last.totalVaccinations)} - ${this.vaccinateDetail.data.last.totalVaccinationsPerHundred}%',
                        ),
                        StatisticRow(
                          text: 'Total Distribution: ',
                          color: MyColors.hotGreen,
                          value:
                              '${Util.toNumericFormat(this.vaccinateDetail.data.last.totalDistribution)} - ${this.vaccinateDetail.data.last.distributionPercentage}%',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
