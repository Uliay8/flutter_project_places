import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:flutter_project_places/features/place_detail/ui/widgets/heart_animation_widget.dart';

class PlaceDetailWM implements IPlaceDetailWM {
  final IPlaceDetailModel _model;
  final _heartAnimationKey = GlobalKey<HeartAnimationWidgetState>();

  PlaceDetailWM(this._model);

  @override
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey => _heartAnimationKey;

  @override
  PlaceEntity get placeEntity => _model.placeEntity;

  @override
  bool isFavorite() {
    return _model.isFavorite();
  }

  @override
  void onLikePressed() {
    final needToAnimated = _model.toggleFavorite();
    if (needToAnimated) {
      _heartAnimationKey.currentState?.animate();
    }
  }
}

abstract class IPlaceDetailWM {
  /// Место.
  PlaceEntity get placeEntity;

  /// Обработчик нажатия на кнопку "лайк".
  void onLikePressed();

  /// Проверяет, добавлено ли место в избранное.
  bool isFavorite();

  /// Ключ для анимации сердца.
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey;
}
