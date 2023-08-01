import 'dart:convert';

import 'package:things_stuff_client/src/features/things/interactor/entities/dto.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesDTO extends DTO{
  int? id;
  String? name;

  CategoriesDTO();

  CategoriesDTO copyWith({
    int? id,
    String? name,
  }) {
    return CategoriesDTO()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CategoriesDTO.fromMap(Map<String, dynamic> map) {
    return CategoriesDTO()
      ..id = map['id'] as int
      ..name = map['name'] as String;
  }

  String toJson() => json.encode(toMap());

  factory CategoriesDTO.fromJson(String source) =>
      CategoriesDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, name: $name)';

  @override
  bool operator ==(covariant CategoriesDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
