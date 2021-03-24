import 'dart:collection';

import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/vaccination/world_vaccination_header.dart';
import 'package:flutter/material.dart';

class VaccinationRoute extends StatelessWidget {
  final LinkedHashMap<dynamic, List<Map<String, String>>> usGrouped;
  final List<Vaccination> vaccinatedList;

  const VaccinationRoute({Key key, this.usGrouped, this.vaccinatedList})
      : super(key: key);

  int get getVaccinationCount {
    int totalCount = 0;
    vaccinatedList.forEach((vaccination) =>
        totalCount += int.parse(vaccination.totalVaccinations));
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 90,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: MyColors.background),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                WorldVaccinationHeader(vaccinationCount: getVaccinationCount),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
