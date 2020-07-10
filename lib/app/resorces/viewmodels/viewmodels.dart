import 'package:flutter_pepper/app/repository/article_repository.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'viewmodels.freezed.dart';
part 'viewmodels.g.dart';

@freezed
abstract class ShopsState with _$ShopsState {
  const factory ShopsState({
    @Default([]) Shops shops,
  }) = _ShopsState;

  factory ShopsState.fromJson(Map<String, dynamic> json) =>
      _$ShopsStateFromJson(json);
}

// counter_controller.dart
class ShopController extends StateNotifier<ShopsState> {
  ShopController(this.repository) : super(ShopsState(shops: Shops()));

  final ArticleRepository repository;

  Future<void> fetchCount() async {
    state = state.copyWith(shops: await repository.getShops());
  }

  void increment() {
    state = state.copyWith(shops: state.shops);
  }
}
