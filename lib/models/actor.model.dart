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

  Actor({
    required this.name,
    required this.heigth,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
        name: json['name'] as String,
        heigth: json['height'] as String,
        mass: json['mass'] as String,
        hairColor: json['hair_color'] as String,
        skinColor: json['skin_color'] as String,
        eyeColor: json['eye_color'] as String,
        birthYear: json['birth_year'] as String,
        gender: json['gender'] as String,
        homeworld: json['homeworld'] as String,
        films: json['films'] as List,
        species: json['species'] as List,
        vehicles: json['vehicles'] as List,
        starships: json['starships'] as List,
        created: json['created'] as String,
        edited: json['edited'] as String,
        url: json['url'] as String);
  }
}
