class Vaccination {
  String country;
  String date;
  String totalVaccinations;
  String peopleVaccinated;
  String peopleFullyVaccinated;
  String totalVaccinationsPerHundred;
  String peopleVaccinatedPerHundred;
  String peopleFullyVaccinatedPerHundred;

  Vaccination(
      this.country,
      this.date,
      this.totalVaccinations,
      this.peopleVaccinated,
      this.peopleFullyVaccinated,
      this.totalVaccinationsPerHundred,
      this.peopleVaccinatedPerHundred,
      this.peopleFullyVaccinatedPerHundred);

  factory Vaccination.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> data = jsonData['data'];
    data.sort((a, b) =>
        DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));
    var lastData = data[0];

    String totalVax = lastData['total_vaccinations'] != null
        ? lastData['total_vaccinations'].toString()
        : '0';
    String peopleVax = lastData['people_vaccinated'] != null
        ? lastData['people_vaccinated'].toString()
        : '0';
    String fullyVax = lastData['people_fully_vaccinated'] != null
        ? lastData['people_fully_vaccinated'].toString()
        : '0';
    String totalVaxPercent = lastData['total_vaccinations_per_hundred'] != null
        ? lastData['total_vaccinations_per_hundred'].toString()
        : '0';
    String peopleVaxPercentage =
        lastData['people_vaccinated_per_hundred'] != null
            ? lastData['people_vaccinated_per_hundred'].toString()
            : '0';
    String totalFullyVax =
        lastData['people_fully_vaccinated_per_hundred'] != null
            ? lastData['people_fully_vaccinated_per_hundred'].toString()
            : '0';

    return Vaccination(
        jsonData['country'],
        lastData['date'],
        totalVax,
        peopleVax,
        fullyVax,
        totalVaxPercent,
        peopleVaxPercentage,
        totalFullyVax);
  }
}
