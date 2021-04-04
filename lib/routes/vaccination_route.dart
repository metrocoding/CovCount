import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/models/vaccine_history_chart.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/routes/vaccination_countries_route.dart';
import 'package:covid_count/widgets/linear_chart.dart';
import 'package:covid_count/widgets/vaccination/world_vaccination_header.dart';
import 'package:flutter/material.dart';

class VaccinationRoute extends StatefulWidget {
  final List<Vaccination> usGrouped;
  final List<Vaccination> vaccinatedList;

  const VaccinationRoute({Key key, this.usGrouped, this.vaccinatedList})
      : super(key: key);

  @override
  _VaccinationRouteState createState() => _VaccinationRouteState();
}

class _VaccinationRouteState extends State<VaccinationRoute> {
  List<String> _locationNames = [];

  int get getVaccinationCount {
    int totalCount = 0;
    widget.vaccinatedList.forEach((vaccination) {
      if (vaccination.location == 'World')
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
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 90),
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
                            vaccinatedList: this.widget.vaccinatedList,
                            title: 'Global Vaccination List',
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
                                  'World Vaccination Detail',
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VaccinationCountryRoute(
                          vaccinatedList: this.widget.usGrouped,
                          title: 'US Vaccination List',
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
                              child: Image.asset(
                                  'assets/images/united-states.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'US Vaccination Detail',
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
                LinearChart(
                  title: 'Vaccination reports (million dose)',
                  vaccinatedList: getTopTenList(),
                  locationNames: _locationNames,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<List<VaccinationChartData>> getTopTenList({isForPopulation = false}) {
    List<List<VaccinationChartData>> vaccinationDataList = [];
    List<String> locs = [];

    var newList = [
      ...this.widget.vaccinatedList.where((el) => el.iso.length == 3)
    ];

    if (isForPopulation)
      newList.sort((a, b) =>
          double.parse(b.data.last.totalVaccinationsPerHundred).compareTo(
              double.parse(a.data.last.totalVaccinationsPerHundred)));
    else
      newList.sort((a, b) => int.parse(b.data.last.totalVaccinations)
          .compareTo(int.parse(a.data.last.totalVaccinations)));

    newList = newList.take(10).toList();

    List<String> dates = [];
    newList.forEach((country) {
      country.data.forEach((data) {
        if (!dates.contains(data.date)) dates.add(data.date);
      });
    });

    newList.forEach((country) {
      dates.forEach((date) {
        if (!country.data.any((data) => data.date == date)) {
          country.data.add(VaccineData(date, '0', '0', '0', '0', '0', '0'));
        }
      });
      country.data.sort(
          (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
    });

    newList.forEach((element) {
      if (isForPopulation)
        vaccinationDataList
            .add(VaccinationChartData.makePercentageVaccine(element));
      else
        vaccinationDataList.add(VaccinationChartData.makeListVaccine(element));
      locs.add(element.location);
    });

    setState(() {
      _locationNames = locs;
    });

    return vaccinationDataList;
  }
}
