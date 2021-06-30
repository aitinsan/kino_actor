class Actor {
  final String name;
  final String heigth;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List films;
  final List species;
  final List vehicles;
  final List starships;
  final String created;
  final String edited;
  final String url;

  Actor(
    this.name,
    this.heigth,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  );
  
  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
        json['name'] as String,
        json['height'] as String,
        json['mass'] as String,
        json['hair_color'] as String,
        json['skin_color'] as String,
        json['eye_color'] as String,
        json['birth_year'] as String,
        json['gender'] as String,
        json['homeworld'] as String,
        json['films'] as List,
        json['species'] as List,
        json['vehicles'] as List,
        json['starships'] as List,
        json['created'] as String,
        json['edited'] as String,
        json['url'] as String);
  }
}
