import 'package:floor/floor.dart';
@entity
class Genre {
  @primaryKey
  final int id;
  final String name;

  const Genre({
    required this.name,
    required this.id,
  });
}
