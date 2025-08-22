import 'package:flutter/foundation.dart';
import 'package:flutter_project_places/features/common/models/place.dart';

abstract interface class IFavoritesRepository {
  /// [ValueListenable] с локальным набором избранных карточек.
  ValueListenable<List<Place>> get favoritesListenable;

  /// Получение избранных мест.
  Future<void> fetchFavorites();

  /// Освобождение ресурсов.
  void dispose();

  /// Переключение статуса избранного места.
  void toggleFavorite(Place place);

  /// Удалить избранное место.
  void removeFavorite(Place place);

  /// Проверить, является ли место избранным.
  bool isFavorite(Place place);
}
