import 'package:collection/collection.dart';

class UnitedStateVaccination {
  String date;
  String location;
  String totalVaccinations;
  String totalDistributed;
  String peopleVaccinated;
  String peopleFullyVaccinatedPerHundred;
  String totalVaccinationsPerHundred;
  String peopleFullyVaccinated;
  String peopleVaccinatedPerHundred;
  String distributedPerHundred;
  String dailyVaccinations;
  String dailyVaccinationsPerMillion;
  String shareDosesUsed;

  UnitedStateVaccination(
      this.date,
      this.location,
      this.totalVaccinations,
      this.totalDistributed,
      this.peopleVaccinated,
      this.peopleFullyVaccinatedPerHundred,
      this.totalVaccinationsPerHundred,
      this.peopleFullyVaccinated,
      this.peopleVaccinatedPerHundred,
      this.distributedPerHundred,
      this.dailyVaccinations,
      this.dailyVaccinationsPerMillion,
      this.shareDosesUsed);

  static dynamic csvToList(List<dynamic> rowsAsListOfValues) {
    // List<UnitedStateVaccination> usVax = [];
    List<Map<String, String>> mapList = [];

    for (int i = 1; i < rowsAsListOfValues.length; i++) {
      var tvax = rowsAsListOfValues[i][2] != ''
          ? rowsAsListOfValues[i][2].toString()
          : '0';
      var tdist = rowsAsListOfValues[i][3] != ''
          ? rowsAsListOfValues[i][3].toString()
          : '0';
      var peopleVax = rowsAsListOfValues[i][4] != ''
          ? rowsAsListOfValues[i][4].toString()
          : '0';
      var peopleFullPer = rowsAsListOfValues[i][5] != ''
          ? rowsAsListOfValues[i][5].toStringAsFixed(2)
          : '0';
      var totalVaxPer = rowsAsListOfValues[i][6] != ''
          ? rowsAsListOfValues[i][6].toStringAsFixed(2)
          : '0';
      var peopleFullyVax = rowsAsListOfValues[i][7] != ''
          ? rowsAsListOfValues[i][7].toString()
          : '0';
      var peopleVaxPer = rowsAsListOfValues[i][8] != ''
          ? rowsAsListOfValues[i][8].toStringAsFixed(2)
          : '0';
      var distPer = rowsAsListOfValues[i][9] != ''
          ? rowsAsListOfValues[i][9].toStringAsFixed(2)
          : '0';
      var dailyVax = rowsAsListOfValues[i][11] != ''
          ? rowsAsListOfValues[i][11].toString()
          : '0';
      var dailyPerMili = rowsAsListOfValues[i][12] != ''
          ? (rowsAsListOfValues[i][12]).toStringAsFixed(2)
          : '0';
      var sharedDose = rowsAsListOfValues[i][13] != ''
          ? (rowsAsListOfValues[i][13]).toStringAsFixed(3)
          : '0';

      mapList.add({
        "date": rowsAsListOfValues[i][0],
        "location": rowsAsListOfValues[i][1],
        "totalVaccinations": tvax,
        "totalDistributed": tdist,
        "peopleVaccinated": peopleVax,
        "peopleFullyVaccinatedPerHundred": peopleFullPer,
        "totalVaccinationsPerHundred": totalVaxPer,
        "peopleFullyVaccinated": peopleFullyVax,
        "peopleVaccinatedPerHundred": peopleVaxPer,
        "distributedPerHundred": distPer,
        "dailyVaccinations": dailyVax,
        "dailyVaccinationsPerMillion": dailyPerMili,
        "shareDosesUsed": sharedDose,
      });

      // var us = UnitedStateVaccination(
      //     rowsAsListOfValues[i][0],
      //     rowsAsListOfValues[i][1],
      //     tvax,
      //     tdist,
      //     peopleVax,
      //     peopleFullPer,
      //     totalVaxPer,
      //     peopleFullyVax,
      //     peopleVaxPer,
      //     distPer,
      //     dailyVax,
      //     dailyPerMili,
      //     sharedDose);

      // usVax.add(us);
    }

    var newGroupedList = groupBy(mapList, (obj) => obj['location']);
    return [
      // usVax,
      newGroupedList
    ];
  }
}
