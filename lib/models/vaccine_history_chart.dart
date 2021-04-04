import 'package:covid_count/models/vaccination.dart';

class VaccinationChartData {
  String date;
  double total;

  VaccinationChartData(this.date, this.total);

  static List<VaccinationChartData> makeList(List<Vaccination> vaccinatedList) {
    try {
      var worldHistory = vaccinatedList
          .where((element) => element.location == 'World')
          .toList()[0]
          .data;

      List<VaccinationChartData> vac = [];
      worldHistory.forEach((history) {
        vac.add(VaccinationChartData(
            history.date, int.parse(history.totalVaccinations) / 1000000));
      });
      return vac;
    } catch (exception) {
      return null;
    }
  }

  static List<VaccinationChartData> makeListVaccine(Vaccination vaccinate) {
    try {
      var worldHistory = vaccinate.data.toList();

      List<VaccinationChartData> vac = [];
      String lastValue = '0';

      worldHistory.forEach((history) {
        if (history.totalVaccinations == '0') {
          history.totalVaccinations = lastValue;
        }
        vac.add(VaccinationChartData(
            history.date, int.parse(history.totalVaccinations) / 1000000));
        lastValue = history.totalVaccinations;
      });

      return vac;
    } catch (exception) {
      return null;
    }
  }

  static List<VaccinationChartData> makePercentageVaccine(
      Vaccination vaccinate) {
    try {
      var worldHistory = vaccinate.data;
      var isFirst = true;

      List<VaccinationChartData> vac = [];
      worldHistory.forEach((history) {
        if (history.totalVaccinations != '0' || isFirst)
          vac.add(VaccinationChartData(
              history.date, double.parse(history.totalVaccinationsPerHundred)));
        isFirst = false;
      });
      return vac;
    } catch (exception) {
      return null;
    }
  }
}
