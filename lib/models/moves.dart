// A class created to store the necessary details of a move used by pokemon
class Moves {
  Moves(
      {this.name,
      this.type,
      this.power,
      this.category,
      this.accuracy,
      this.pp,
      this.changes,
      this.effects});

  final String name;
  final String type;
  final String category;
  final String power;
  final String accuracy;
  final String pp;
  String effects;
  String changes;
  factory Moves.fromJson(Map<String, String> json) {
    return new Moves(
        name: json["name"], type: json["type"], category: json["physical"]);
  }
}
/*
{
        "name": "counter",
        "type": "fighting",
        "category": "physical",
        "power": null,
        "accuracy": 1.0,
        "pp": 20,
        "priority": -1,
        "effects": [
            "When hit by a Physical Attack, user strikes back with 2x power."
        ]
    },
    */
