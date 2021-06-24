class People {
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

  People(
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

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
        json['name'],
        json['height'],
        json['mass'],
        json['hair_color'],
        json['skin_color'],
        json['eye_color'],
        json['birth_year'],
        json['gender'],
        json['homeworld'],
        json['films'],
        json['species'],
        json['vehicles'],
        json['starships'],
        json['created'],
        json['edited'],
        json['url']);
  }
}
