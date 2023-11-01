import 'dart:convert';

import 'package:floor/floor.dart';

class CategoryListConverter extends TypeConverter<List<String>, String> {
  static const String categoryJsonName = 'categories';
  @override
  List<String> decode(String databaseValue) {
    final dynamic jsonFile = json.decode(databaseValue);
    return List<String>.from(jsonFile[categoryJsonName]);
  }

  @override
  String encode(List<String> value) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data.addAll(<String, dynamic>{categoryJsonName: value});
    return json.encode(data);
  }
}
