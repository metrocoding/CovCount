class World {
  int cases;
  int deaths;
  int recovered;

  World(this.cases, this.deaths, this.recovered);

  factory World.fromJson(Map<String, dynamic> json) {
    return World(json['cases'], json['deaths'], json['recovered']);
  }
}
