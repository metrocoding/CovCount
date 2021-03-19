class Country {
  int updated;
  String country;
  String flag;
  int cases;
  String todayCases;
  int deaths;
  String todayDeaths;
  int recovered;
  String todayRecovered;
  int active;
  int critical;
  String casesPerOneMillion;
  String deathsPerOneMillion;
  int tests;
  String testsPerOneMillion;
  int population;
  String continent;
  String oneCasePerPeople;
  String oneDeathPerPeople;
  String oneTestPerPeople;
  String activePerOneMillion;
  String recoveredPerOneMillion;
  String criticalPerOneMillion;

  Country(
      this.updated,
      this.country,
      this.flag,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion);

  factory Country.fromJson(Map<String, dynamic> json) {
    String tRecovered, tDeath, tCase;

    if (json['todayCases'] == 0 &&
        json['todayDeaths'] == 0 &&
        json['todayRecovered'] == 0) {
      tRecovered = tDeath = tCase = 'N/A';
    } else {
      tCase = json['todayCases'].toString();
      tDeath = json['todayDeaths'].toString();
      tRecovered = json['todayRecovered'].toString();
    }

    return Country(
        json['updated'],
        json['country'],
        json['countryInfo']['flag'],
        json['cases'],
        tCase,
        json['deaths'],
        tDeath,
        json['recovered'],
        tRecovered,
        json['active'],
        json['critical'],
        json['casesPerOneMillion'].toString(),
        json['deathsPerOneMillion'].toString(),
        json['tests'],
        json['testsPerOneMillion'].toString(),
        json['population'],
        json['continent'],
        json['oneCasePerPeople'].toString(),
        json['oneDeathPerPeople'].toString(),
        json['oneTestPerPeople'].toString(),
        json['activePerOneMillion'].toString(),
        json['recoveredPerOneMillion'].toString(),
        json['criticalPerOneMillion'].toString());
  }
}
