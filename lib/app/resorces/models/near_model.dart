import 'package:json_annotation/json_annotation.dart';

part 'near_model.g.dart';

@JsonSerializable(nullable: false)
class Shop {
  final Photo photo;
  final String id;
  final String address; // "東京都中央区八重洲１－７－４　ナリカワビル1F・B1F"
  final double lng; // double
  final String show;
  final String name;
  final Genre genre;
  @JsonKey(name: 'shop_detail_memo')
  final String memo;
  final double lat; // double
  final String access;
  @JsonKey(name: 'catch')
  final String catchCopy;
  @JsonKey(name: 'open')
  final String time;

  Shop({
    this.photo,
    this.id,
    this.address,
    this.lng,
    this.show,
    this.name,
    this.genre,
    this.memo,
    this.lat,
    this.access,
    this.catchCopy,
    this.time,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}

@JsonSerializable(nullable: false)
class Genre {
  final String code;
  final String name;

  Genre({this.code, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@JsonSerializable(nullable: false)
class Photo {
  final Mobile mobile; // Photo
  final Pc pc; // LargeArea

  Photo({this.mobile, this.pc});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@JsonSerializable(nullable: false)
class Mobile {
  final String l;
  final String s;

  Mobile({this.l, this.s});

  factory Mobile.fromJson(Map<String, dynamic> json) => _$MobileFromJson(json);
}

@JsonSerializable(nullable: false)
class Pc {
  final String l;
  final String s;

  Pc({this.l, this.s});

  factory Pc.fromJson(Map<String, dynamic> json) => _$PcFromJson(json);
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

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
