import 'package:csv/csv.dart';

class Vaccination {
  String location;
  String iso;
  List<VaccineData> data;

  Vaccination(this.location, this.iso, this.data);

  factory Vaccination.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> dataValues = jsonData['data'];

    List<VaccineData> data = [];
    for (int i = 0; i < dataValues.length; i++) {
      data.add(VaccineData.fromJson(dataValues[i]));
    }

    return Vaccination(jsonData['country'], jsonData['iso_code'], data);
  }

  static List<Vaccination> csvToList(String csvString) {
    var rowsAsListOfValues =
        const CsvToListConverter().convert(csvString, eol: "\n");

    List<Vaccination> states = [];

    for (int i = 1; i < rowsAsListOfValues.length; i++) {
      var totalVaccination = rowsAsListOfValues[i][2] != ''
          ? rowsAsListOfValues[i][2].toStringAsFixed(0)
          : '0';
      var peopleVaccinated = rowsAsListOfValues[i][4] != ''
          ? rowsAsListOfValues[i][4].toStringAsFixed(0)
          : '0';
      var peopleFullyVaccinatedPercentage = rowsAsListOfValues[i][5] != ''
          ? rowsAsListOfValues[i][5].toStringAsFixed(2)
          : '0';
      var totalVaccinationPercentage = rowsAsListOfValues[i][6] != ''
          ? rowsAsListOfValues[i][6].toStringAsFixed(2)
          : '0';
      var peopleFullyVaccinated = rowsAsListOfValues[i][7] != ''
          ? rowsAsListOfValues[i][7].toStringAsFixed(0)
          : '0';
      var peopleVaccinationPercentage = rowsAsListOfValues[i][8] != ''
          ? rowsAsListOfValues[i][8].toStringAsFixed(2)
          : '0';
      var totalDistribution = rowsAsListOfValues[i][3] != ''
          ? rowsAsListOfValues[i][3].toStringAsFixed(0)
          : '0';
      var distributionPercentage = rowsAsListOfValues[i][9] != ''
          ? rowsAsListOfValues[i][9].toStringAsFixed(2)
          : '0';
      var dailyVaccination = rowsAsListOfValues[i][11] != ''
          ? rowsAsListOfValues[i][11].toStringAsFixed(0)
          : '0';
      // var dailyVaccinationPerMillion = rowsAsListOfValues[i][12] != ''
      //     ? (rowsAsListOfValues[i][12]).toStringAsFixed(2)
      //     : '0';
      // var sharedDoses = rowsAsListOfValues[i][13] != ''
      //     ? (rowsAsListOfValues[i][13]).toStringAsFixed(3)
      //     : '0';

      var location = rowsAsListOfValues[i][1];
      var date = rowsAsListOfValues[i][0];

      var vaccineData = VaccineData(
          date,
          totalVaccination,
          peopleVaccinated,
          peopleFullyVaccinated,
          totalVaccinationPercentage,
          peopleVaccinationPercentage,
          peopleFullyVaccinatedPercentage,
          totalDistribution: totalDistribution,
          dailyVaccination: dailyVaccination,
          distributionPercentage: distributionPercentage);

      if (states.any((state) => state.location == location)) {
        var state = states.singleWhere((state) => state.location == location);
        state.data.add(vaccineData);
      } else {
        states.add(Vaccination(location, '', [vaccineData]));
      }
    }

    return states;
  }
}

class VaccineData {
  String date;
  String totalVaccinations;
  String peopleVaccinated;
  String peopleFullyVaccinated;
  String totalVaccinationsPerHundred;
  String peopleVaccinatedPerHundred;
  String peopleFullyVaccinatedPerHundred;
  String totalDistribution;
  String distributionPercentage;
  String dailyVaccination;

  VaccineData(
      this.date,
      this.totalVaccinations,
      this.peopleVaccinated,
      this.peopleFullyVaccinated,
      this.totalVaccinationsPerHundred,
      this.peopleVaccinatedPerHundred,
      this.peopleFullyVaccinatedPerHundred,
      {this.totalDistribution,
      this.distributionPercentage,
      this.dailyVaccination});

  factory VaccineData.fromJson(dynamic jsonData) {
    String totalVax = jsonData['total_vaccinations'] != null
        ? jsonData['total_vaccinations'].toString()
        : '0';
    String peopleVax = jsonData['people_vaccinated'] != null
        ? jsonData['people_vaccinated'].toString()
        : '0';
    String fullyVax = jsonData['people_fully_vaccinated'] != null
        ? jsonData['people_fully_vaccinated'].toString()
        : '0';
    String totalVaxPercent = jsonData['total_vaccinations_per_hundred'] != null
        ? jsonData['total_vaccinations_per_hundred'].toString()
        : '0';
    String peopleVaxPercentage =
        jsonData['people_vaccinated_per_hundred'] != null
            ? jsonData['people_vaccinated_per_hundred'].toString()
            : '0';
    String totalFullyVax =
        jsonData['people_fully_vaccinated_per_hundred'] != null
            ? jsonData['people_fully_vaccinated_per_hundred'].toString()
            : '0';

    return VaccineData(jsonData['date'], totalVax, peopleVax, fullyVax,
        totalVaxPercent, peopleVaxPercentage, totalFullyVax);
  }
}
