import 'package:flutter_project_places/api/service/api_client.dart';
import 'package:flutter_project_places/core/data/repositories/base_repository.dart';
import 'package:flutter_project_places/core/domain/entities/result/request_operation.dart';
import 'package:flutter_project_places/features/common/data/converters/place_converter.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';
import 'package:flutter_project_places/features/places/domain/repositories/i_places_repository.dart';

/// Реализация [IPlacesRepository].
final class PlacesRepository extends BaseRepository implements IPlacesRepository {
  final ApiClient _apiClient;
  final IPlaceDtoToEntityConverter _placeDtoToEntityConverter;

  PlacesRepository({required ApiClient apiClient, required IPlaceDtoToEntityConverter placeDtoToEntityConverter})
    : _apiClient = apiClient,
      _placeDtoToEntityConverter = placeDtoToEntityConverter;

  @override
  RequestOperation<List<PlaceEntity>> getPlaces() {
    return makeApiCall<List<PlaceEntity>>(() async {
      final placesDto = await _apiClient.getPlaces();
      final placesEntities = _placeDtoToEntityConverter.convertMultiple(placesDto).toList();
      return placesEntities;
    });
  }
}
