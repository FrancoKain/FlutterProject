class GenreModel {
  final int id;
  final String name;

  const GenreModel({
    required this.name,
    required this.id,
  });

  factory GenreModel.fromJson(Map json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
