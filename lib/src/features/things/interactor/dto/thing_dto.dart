// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:things_stuff_client/src/features/categories/interactor/dto/category.dart';
import 'package:things_stuff_client/src/features/things/interactor/entities/dto.dart';

class ThingDTO implements DTO {
  int? id;
  String? name;
  String? image;
  double? approximateValue;
  int? categoryId;
  CategoriesDTO? category;

  ThingDTO();

  ThingDTO copyWith({
    int? id,
    String? name,
    String? image,
    double? approximateValue,
    CategoriesDTO? category,
    int? categoryId,
  }) {
    return ThingDTO()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image
      ..approximateValue = approximateValue ?? this.approximateValue
      ..category = category ?? this.category
      ..categoryId = categoryId ?? this.categoryId;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (approximateValue != null) 'approximateValue': approximateValue,
      if (category != null) 'category': category!.toMap(),
      if (categoryId != null) 'categoryId': categoryId,
    };
  }

  factory ThingDTO.fromMap(Map<String, dynamic> map) {
    return ThingDTO()
      ..id = map['id']
      ..name = map['name']
      ..image = map['image']
      ..approximateValue = double.parse(map['approximateValue'])
      ..category = map.containsKey('category')
          ? CategoriesDTO.fromMap(map['category'])
          : null
      ..categoryId = map['categoryId'];
  }

  String toJson() => json.encode(toMap());

  factory ThingDTO.fromJson(String source) =>
      ThingDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ThingModel(id: $id, name: $name, image: $image,'
        ' approximateValue: $approximateValue, category: $category,'
        ' categoryId: $categoryId)';
  }

  @override
  bool operator ==(covariant ThingDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.approximateValue == approximateValue &&
        other.category == category &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        approximateValue.hashCode ^
        category.hashCode ^
        categoryId.hashCode;
  }
}
