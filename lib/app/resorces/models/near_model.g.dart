// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    photo: Photo.fromJson(json['photo'] as Map<String, dynamic>),
    id: json['id'] as String,
    address: json['address'] as String,
    lng: (json['lng'] as num).toDouble(),
    show: json['show'] as String,
    name: json['name'] as String,
    genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    memo: json['shop_detail_memo'] as String,
    lat: (json['lat'] as num).toDouble(),
    access: json['access'] as String,
    catchCopy: json['catch'] as String,
    time: json['open'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'photo': instance.photo,
      'id': instance.id,
      'address': instance.address,
      'lng': instance.lng,
      'show': instance.show,
      'name': instance.name,
      'genre': instance.genre,
      'shop_detail_memo': instance.memo,
      'lat': instance.lat,
      'access': instance.access,
      'catch': instance.catchCopy,
      'open': instance.time,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    mobile: Mobile.fromJson(json['mobile'] as Map<String, dynamic>),
    pc: Pc.fromJson(json['pc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'mobile': instance.mobile,
      'pc': instance.pc,
    };

Mobile _$MobileFromJson(Map<String, dynamic> json) {
  return Mobile(
    l: json['l'] as String,
    s: json['s'] as String,
  );
}

Map<String, dynamic> _$MobileToJson(Mobile instance) => <String, dynamic>{
      'l': instance.l,
      's': instance.s,
    };

Pc _$PcFromJson(Map<String, dynamic> json) {
  return Pc(
    l: json['l'] as String,
    s: json['s'] as String,
  );
}

Map<String, dynamic> _$PcToJson(Pc instance) => <String, dynamic>{
      'l': instance.l,
      's': instance.s,
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
