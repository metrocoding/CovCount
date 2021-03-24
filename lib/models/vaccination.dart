class Vaccination {
  String country;
  String iso;
  List<VaccineData> data;

  Vaccination(this.country, this.iso, this.data);

  factory Vaccination.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> dataValues = jsonData['data'];

    List<VaccineData> data = [];
    for (int i = 0; i < dataValues.length; i++) {
      data.add(VaccineData.fromJson(dataValues[i]));
    }

    return Vaccination(jsonData['country'], jsonData['iso_code'], data);
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

  VaccineData(
      this.date,
      this.totalVaccinations,
      this.peopleVaccinated,
      this.peopleFullyVaccinated,
      this.totalVaccinationsPerHundred,
      this.peopleVaccinatedPerHundred,
      this.peopleFullyVaccinatedPerHundred);

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
