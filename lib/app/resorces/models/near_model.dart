import 'package:json_annotation/json_annotation.dart';

part 'near_model.g.dart';

@JsonSerializable(nullable: false)
class Shop {
  final String photo;

  final String large_area;

  final String id;

  final String address;

  final String lng;

  final String show;

  final String name;

  final String genre;

  final String open;

  final String shop_detail_memo;

  final String middle_area;

  final String lat;

  final String logo_image;

  final String urls;

  final String close;

  final String budget_memo;

  final String small_area;

  final String access;

  final String sub_genre;

  Shop(
      {this.id,
      this.address,
      this.lng,
      this.show,
      this.name,
      this.genre,
      this.open,
      this.shop_detail_memo,
      this.middle_area,
      this.lat,
      this.logo_image,
      this.urls,
      this.close,
      this.budget_memo,
      this.small_area,
      this.access,
      this.sub_genre});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}
