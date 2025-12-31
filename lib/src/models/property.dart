import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
// part 'property.g.dart';

@freezed
abstract class Property with _$Property {
  const factory Property({
    required String id,
    required String title,
    required String location,
    required String price,
    required String imageUrl,
    String? description,
    double? area,
    int? rooms,
    String? propertyType,
    @Default(false) bool isFeatured,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      price: json['price'],
      imageUrl: json['image_url'],
    );
  }
}
