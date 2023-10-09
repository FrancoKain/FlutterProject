class GenreModel {
  final int id;
  final String name;

  const GenreModel({
    required this.name,
    required this.id,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<GenreModel> genreList(List<dynamic> data) {
    return data
        .map(
          (genre) => GenreModel.fromJson(
            genre,
          ),
        )
        .toList();
  }
}
