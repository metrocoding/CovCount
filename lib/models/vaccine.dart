import 'package:html_unescape/html_unescape.dart';

class Vaccine {
  String candidate;
  String mechanism;
  List<String> sponsors;
  String details;
  String trialPhase;
  List<String> institutions;

  Vaccine(this.candidate, this.mechanism, this.sponsors, this.details,
      this.trialPhase, this.institutions);

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    List<String> sponsors = [];
    for (int i = 0; i < json['sponsors'].length; i++)
      sponsors.add(json['sponsors'][i]);

    List<String> institutions = [];
    for (int i = 0; i < json['institutions'].length; i++)
      institutions.add(json['institutions'][i]);

    var unescape = new HtmlUnescape();

    return Vaccine(json['candidate'], json['mechanism'], sponsors,
        unescape.convert(json['details']), json['trialPhase'], institutions);
  }
}
