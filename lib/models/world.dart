import 'package:covid_count/utility/util.dart';

class World {
  String cases;
  String deaths;
  String recovered;

  World(this.cases, this.deaths, this.recovered);

  factory World.fromJson(Map<String, dynamic> json) {
    return World(
        Util.toNumericFormat(json['cases'].toString()),
        Util.toNumericFormat(json['deaths'].toString()),
        Util.toNumericFormat(json['recovered'].toString()));
  }
}
