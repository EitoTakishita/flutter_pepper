import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(nullable: false)
class Shop {
  final String id;
  final String name;

  Shop({this.id, this.name});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}

@JsonSerializable(nullable: false)
class Shops {
  final List<Shop> shop;

  Shops({this.shop});

  factory Shops.fromJson(Map<String, dynamic> json) => _$ShopsFromJson(json);
}

@JsonSerializable(nullable: false)
class Results {
  final Shops results;

  Results({this.results});

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
}
