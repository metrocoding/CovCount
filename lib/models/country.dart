import 'package:covid_count/utility/util.dart';

class Country {
  String updated;
  String country;
  String flag;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String todayRecovered;
  String active;
  String critical;
  String casesPerOneMillion;
  String deathsPerOneMillion;
  String tests;
  String testsPerOneMillion;
  String population;
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
        Util.toNumericFormat(json['updated'].toString()),
        json['country'],
        json['countryInfo']['flag'],
        Util.toNumericFormat(json['cases'].toString()),
        Util.toNumericFormat(tCase),
        Util.toNumericFormat(json['deaths'].toString()),
        Util.toNumericFormat(tDeath),
        Util.toNumericFormat(json['recovered'].toString()),
        Util.toNumericFormat(tRecovered),
        Util.toNumericFormat(json['active'].toString()),
        Util.toNumericFormat(json['critical'].toString()),
        Util.toNumericFormat(json['casesPerOneMillion'].toString()),
        Util.toNumericFormat(json['deathsPerOneMillion'].toString()),
        Util.toNumericFormat(json['tests'].toString()),
        Util.toNumericFormat(json['testsPerOneMillion'].toString()),
        Util.toNumericFormat(json['population'].toString()),
        json['continent'],
        Util.toNumericFormat(json['oneCasePerPeople'].toString()),
        Util.toNumericFormat(json['oneDeathPerPeople'].toString()),
        Util.toNumericFormat(json['oneTestPerPeople'].toString()),
        Util.toNumericFormat(json['activePerOneMillion'].toString()),
        Util.toNumericFormat(json['recoveredPerOneMillion'].toString()),
        Util.toNumericFormat(json['criticalPerOneMillion'].toString()));
  }
}
