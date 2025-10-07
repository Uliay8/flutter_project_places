import 'package:flutter_project_places/core/domain/entities/result/request_operation.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';

/// Интерфейс репозитория для получения мест.
abstract interface class IPlacesRepository {
  /// Получить список мест.
  RequestOperation<List<PlaceEntity>> getPlaces();
}
