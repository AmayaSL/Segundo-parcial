class RickAndMorty{
  
  final int id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? image;

  RickAndMorty({required this.id, 
  this.name, 
  this.status, 
  this.species, 
  this.gender,
  this.image});

  factory RickAndMorty.fromJsonMap(Map<dynamic , dynamic> json)
  => RickAndMorty(
    id :json["id"],
    name: json["name"] ?? "No nombre",
    status: json["status"] ?? "No estado",
    species: json["species"] ?? "No especies",
    gender: json["gender"] ?? "No genero",
    image: json["image"] ?? "No imagen"
    );

} 