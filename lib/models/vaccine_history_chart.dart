import 'package:covid_count/models/vaccination.dart';

class VacHistory {
  String date;
  double total;

  VacHistory(this.date, this.total);

  static List<VacHistory> makeList(List<Vaccination> vaccinatedList) {
    try {
      var worldHistory = vaccinatedList
          .where((element) => element.country == 'World')
          .toList()[0]
          .data;

      List<VacHistory> vac = [];
      worldHistory.forEach((history) {
        vac.add(VacHistory(
            history.date, int.parse(history.totalVaccinations) / 1000000));
      });
      return vac;
    } catch (exception) {
      return null;
    }
  }

  static List<VacHistory> makeListVaccine(Vaccination vaccinate) {
    try {
      var worldHistory = vaccinate.data;

      List<VacHistory> vac = [];
      worldHistory.forEach((history) {
        vac.add(VacHistory(
            history.date, int.parse(history.totalVaccinations) / 1000000));
      });
      return vac;
    } catch (exception) {
      return null;
    }
  }
}
