// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Shops _$ShopsFromJson(Map<String, dynamic> json) {
  return Shops(
    shop: (json['shop'] as List)
        .map((e) => Shop.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShopsToJson(Shops instance) => <String, dynamic>{
      'shop': instance.shop,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    results: Shops.fromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'results': instance.results,
    };
