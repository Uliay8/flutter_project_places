import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:flutter_project_places/features/common/models/place.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:flutter_project_places/features/place_detail/ui/widgets/heart_animation_widget.dart';

class PlaceDetailWM implements IPlaceDetailWM {
  final IPlaceDetailModel _model;
  final IFavoritesRepository _favoritesRepository;
  final Place _place;
  final _heartAnimationKey = GlobalKey<HeartAnimationWidgetState>();

  PlaceDetailWM(this._model, this._favoritesRepository, this._place);

  @override
  void dispose() {
    _model.dispose();
  }

  @override
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey => _heartAnimationKey;

  @override
  bool isFavorite() {
    return _favoritesRepository.isFavorite(_place);
  }

  @override
  void onLikePressed() {
    final wasFavorite = _favoritesRepository.isFavorite(_place);
    _favoritesRepository.toggleFavorite(_place);
    if (!wasFavorite) {
      _heartAnimationKey.currentState?.animate();
    }
  }

  @override
  ValueListenable<String> get stateListenable => _model.stateListenable;

  @override
  void onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}

abstract class IPlaceDetailWM {
  ValueListenable<String> get stateListenable;
  void dispose();
  void onLikePressed();
  bool isFavorite();
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey;
  void onBackPressed(BuildContext context);
}
