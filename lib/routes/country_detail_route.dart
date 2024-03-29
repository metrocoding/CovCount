import 'package:covid_count/models/country.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:covid_count/widgets/country/detail/statistic_row.dart';
import 'package:covid_count/widgets/country/detail/white_box.dart';
import 'package:covid_count/widgets/country/detail/white_box_title.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  final Country country;

  const CountryDetail({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headerBold = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle subheaderBold =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 10) Navigator.of(context).pop();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: MyColors.background),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          MyColors.lightPink,
                          MyColors.hotPink,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomBackButton(this.country.country),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Population: ',
                          style: headerBold,
                        ),
                        Text(
                          '${this.country.population}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.pink.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continent: ',
                            style: subheaderBold,
                          ),
                          Text(
                            '${this.country.continent}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.pink.shade400,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: WhiteBox(
                      children: [
                        BoxTitle(title: ' Today statistics'),
                        StatisticRow(
                          text: 'Today cases: ',
                          value: '${country.todayCases}',
                        ),
                        StatisticRow(
                          text: 'Today deaths: ',
                          value: '${country.todayDeaths}',
                        ),
                        StatisticRow(
                          text: 'Today recovered: ',
                          value: '${country.todayRecovered}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: WhiteBox(children: [
                        BoxTitle(title: ' Total statistics'),
                        StatisticRow(
                          text: 'Cases: ',
                          value: '${country.cases}',
                        ),
                        StatisticRow(
                          text: 'Deaths: ',
                          value: '${country.deaths}',
                        ),
                        StatisticRow(
                          text: 'Recovered: ',
                          value: '${country.recovered}',
                        ),
                        StatisticRow(
                          text: 'Tests: ',
                          value: '${country.tests}',
                        ),
                        StatisticRow(
                          text: 'Active cases: ',
                          value: '${country.active}',
                        ),
                        StatisticRow(
                          text: 'Critical: ',
                          value: '${country.critical}',
                        )
                      ])),
                  WhiteBox(children: [
                    BoxTitle(title: ' Comparative statistics'),
                    StatisticRow(
                      text: 'Cases per million: ',
                      value: '${country.casesPerOneMillion}',
                    ),
                    StatisticRow(
                      text: 'Deaths per million: ',
                      value: '${country.deathsPerOneMillion}',
                    ),
                    StatisticRow(
                      text: 'Recovered per million: ',
                      value: '${country.recoveredPerOneMillion}',
                    ),
                    StatisticRow(
                      text: 'Tests per million: ',
                      value: '${country.testsPerOneMillion}',
                    ),
                    StatisticRow(
                      text: 'Active per million: ',
                      value: '${country.activePerOneMillion}',
                    ),
                    StatisticRow(
                      text: 'Critical per million: ',
                      value: '${country.criticalPerOneMillion}',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: StatisticRow(
                        text: 'One case per people: ',
                        value: '${country.oneCasePerPeople}',
                      ),
                    ),
                    StatisticRow(
                      text: 'One death per people: ',
                      value: '${country.oneDeathPerPeople}',
                    ),
                    StatisticRow(
                      text: 'One test per people: ',
                      value: '${country.oneTestPerPeople}',
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
