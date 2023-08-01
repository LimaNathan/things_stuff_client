// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:things_stuff_client/src/features/things/categories/models/category.dart';

class ThingDTO {
  int? id;
  String? name;
  String? image;
  double? approximateValue;
  Category? category;

  ThingDTO();

  ThingDTO copyWith({
    int? id,
    String? name,
    String? image,
    double? approximateValue,
    Category? category,
  }) {
    return ThingDTO()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image
      ..approximateValue = approximateValue ?? this.approximateValue
      ..category = category ?? this.category;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'approximateValue': approximateValue,
      'category': category?.toMap(),
    };
  }

  factory ThingDTO.fromMap(Map<String, dynamic> map) {
    return ThingDTO()
      ..id = map['id'] as int
      ..name = map['name'] as String
      ..image = map['image'] as String
      ..approximateValue = map['approximateValue'] as double
      ..category = Category.fromMap(map['category'] as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  factory ThingDTO.fromJson(String source) =>
      ThingDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ThingModel(id: $id, name: $name, image: $image, approximateValue: $approximateValue, category: $category)';
  }

  @override
  bool operator ==(covariant ThingDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.approximateValue == approximateValue &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        approximateValue.hashCode ^
        category.hashCode;
  }
}
