// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    id: json['id'] as String,
    address: json['address'] as String,
    lng: json['lng'] as String,
    show: json['show'] as String,
    name: json['name'] as String,
    genre: json['genre'] as String,
    open: json['open'] as String,
    shop_detail_memo: json['shop_detail_memo'] as String,
    middle_area: json['middle_area'] as String,
    lat: json['lat'] as String,
    logo_image: json['logo_image'] as String,
    urls: json['urls'] as String,
    close: json['close'] as String,
    budget_memo: json['budget_memo'] as String,
    small_area: json['small_area'] as String,
    access: json['access'] as String,
    sub_genre: json['sub_genre'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lng': instance.lng,
      'show': instance.show,
      'name': instance.name,
      'genre': instance.genre,
      'open': instance.open,
      'shop_detail_memo': instance.shop_detail_memo,
      'middle_area': instance.middle_area,
      'lat': instance.lat,
      'logo_image': instance.logo_image,
      'urls': instance.urls,
      'close': instance.close,
      'budget_memo': instance.budget_memo,
      'small_area': instance.small_area,
      'access': instance.access,
      'sub_genre': instance.sub_genre,
    };
