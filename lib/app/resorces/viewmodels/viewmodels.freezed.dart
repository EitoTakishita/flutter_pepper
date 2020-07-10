// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'viewmodels.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ShopsState _$ShopsStateFromJson(Map<String, dynamic> json) {
  return _ShopsState.fromJson(json);
}

class _$ShopsStateTearOff {
  const _$ShopsStateTearOff();

  _ShopsState call({Shops shops = const []}) {
    return _ShopsState(
      shops: shops,
    );
  }
}

// ignore: unused_element
const $ShopsState = _$ShopsStateTearOff();

mixin _$ShopsState {
  Shops get shops;

  Map<String, dynamic> toJson();
  $ShopsStateCopyWith<ShopsState> get copyWith;
}

abstract class $ShopsStateCopyWith<$Res> {
  factory $ShopsStateCopyWith(
          ShopsState value, $Res Function(ShopsState) then) =
      _$ShopsStateCopyWithImpl<$Res>;
  $Res call({Shops shops});
}

class _$ShopsStateCopyWithImpl<$Res> implements $ShopsStateCopyWith<$Res> {
  _$ShopsStateCopyWithImpl(this._value, this._then);

  final ShopsState _value;
  // ignore: unused_field
  final $Res Function(ShopsState) _then;

  @override
  $Res call({
    Object shops = freezed,
  }) {
    return _then(_value.copyWith(
      shops: shops == freezed ? _value.shops : shops as Shops,
    ));
  }
}

abstract class _$ShopsStateCopyWith<$Res> implements $ShopsStateCopyWith<$Res> {
  factory _$ShopsStateCopyWith(
          _ShopsState value, $Res Function(_ShopsState) then) =
      __$ShopsStateCopyWithImpl<$Res>;
  @override
  $Res call({Shops shops});
}

class __$ShopsStateCopyWithImpl<$Res> extends _$ShopsStateCopyWithImpl<$Res>
    implements _$ShopsStateCopyWith<$Res> {
  __$ShopsStateCopyWithImpl(
      _ShopsState _value, $Res Function(_ShopsState) _then)
      : super(_value, (v) => _then(v as _ShopsState));

  @override
  _ShopsState get _value => super._value as _ShopsState;

  @override
  $Res call({
    Object shops = freezed,
  }) {
    return _then(_ShopsState(
      shops: shops == freezed ? _value.shops : shops as Shops,
    ));
  }
}

@JsonSerializable()
class _$_ShopsState implements _ShopsState {
  const _$_ShopsState({this.shops = const []}) : assert(shops != null);

  factory _$_ShopsState.fromJson(Map<String, dynamic> json) =>
      _$_$_ShopsStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final Shops shops;

  @override
  String toString() {
    return 'ShopsState(shops: $shops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShopsState &&
            (identical(other.shops, shops) ||
                const DeepCollectionEquality().equals(other.shops, shops)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shops);

  @override
  _$ShopsStateCopyWith<_ShopsState> get copyWith =>
      __$ShopsStateCopyWithImpl<_ShopsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShopsStateToJson(this);
  }
}

abstract class _ShopsState implements ShopsState {
  const factory _ShopsState({Shops shops}) = _$_ShopsState;

  factory _ShopsState.fromJson(Map<String, dynamic> json) =
      _$_ShopsState.fromJson;

  @override
  Shops get shops;
  @override
  _$ShopsStateCopyWith<_ShopsState> get copyWith;
}
