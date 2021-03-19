class Therapeutic {
  String medicationClass;
  String details;
  String trialPhase;
  String lastUpdate;
  List<String> tradeName;
  List<String> developerResearcher;
  List<String> sponsors;

  Therapeutic(this.medicationClass, this.details, this.trialPhase,
      this.lastUpdate, this.tradeName, this.developerResearcher, this.sponsors);

  factory Therapeutic.fromJson(Map<String, dynamic> json) {
    List<String> sponsors = [];
    List<String> tradeName = [];
    List<String> developerResearcher = [];

    for (int i = 0; i < json['sponsors'].length; i++)
      sponsors.add(json['sponsors'][i]);

    for (int i = 0; i < json['tradeName'].length; i++)
      tradeName.add(json['tradeName'][i]);

    for (int i = 0; i < json['developerResearcher'].length; i++)
      developerResearcher.add(json['developerResearcher'][i]);

    return Therapeutic(
        json['medicationClass'],
        json['details'],
        json['trialPhase'],
        json['lastUpdate'],
        tradeName,
        developerResearcher,
        sponsors);
  }
}
