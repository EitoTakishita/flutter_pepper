// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewmodels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopsState _$_$_ShopsStateFromJson(Map<String, dynamic> json) {
  return _$_ShopsState(
    shops: json['shops'] == null
        ? null
        : Shops.fromJson(json['shops'] as Map<String, dynamic>) ?? [],
  );
}

Map<String, dynamic> _$_$_ShopsStateToJson(_$_ShopsState instance) =>
    <String, dynamic>{
      'shops': instance.shops,
    };
