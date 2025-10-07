import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:flutter_project_places/features/places/domain/entities/places_state.dart';
import 'package:flutter_project_places/features/places/ui/screens/places_model.dart';

abstract class IPlacesWM {
  ValueListenable<PlacesState> get placesStateListenable;
  void dispose();
  void onPlacePressed(BuildContext context, PlaceEntity place);
  void onLikePressed(PlaceEntity place);
  bool isFavorite(PlaceEntity place);
  Future<void> loadPlaces();
}

class PlacesWM implements IPlacesWM {
  final IPlacesModel _model;
  final IFavoritesRepository _favoritesRepository;
  // тут можно показывать снэки

  PlacesWM(this._model, this._favoritesRepository) {
    _model.getPlaces();
  }

  @override
  void dispose() {
    _model.dispose();
  }

  @override
  bool isFavorite(PlaceEntity place) {
    return _favoritesRepository.isFavorite(place);
  }

  @override
  void onLikePressed(PlaceEntity place) {
    _favoritesRepository.toggleFavorite(place);
  }

  @override
  void onPlacePressed(BuildContext context, PlaceEntity place) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceDetailScreenBuilder(place: place)));
  }

  @override
  ValueListenable<PlacesState> get placesStateListenable => _model.placesStateListenable;

  @override
  Future<void> loadPlaces() => _model.getPlaces();
}
