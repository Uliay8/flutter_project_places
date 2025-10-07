import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';

class PlaceDetailModel implements IPlaceDetailModel {
  // final _state = ValueNotifier<String>('Loading');
  final IFavoritesRepository _favoritesRepository;
  final PlaceEntity _placeEntity;

  PlaceDetailModel({
    required PlaceEntity placeEntity,
    required IFavoritesRepository favoritesRepository,
  }) : _favoritesRepository = favoritesRepository,
       _placeEntity = placeEntity;

  @override
  bool isFavorite() {
    return _favoritesRepository.isFavorite(placeEntity);
  }

  @override
  PlaceEntity get placeEntity => _placeEntity;

  @override
  bool toggleFavorite() {
    _favoritesRepository.toggleFavorite(placeEntity);
    return isFavorite();
  }
}

abstract class IPlaceDetailModel {
  /// Проверяет, добавлено ли место в избранное.
  bool isFavorite();

  /// Переключает значение лайка на месте.
  /// Возвращает итоговое значение.
  bool toggleFavorite();

  /// Место.
  PlaceEntity get placeEntity;
}
