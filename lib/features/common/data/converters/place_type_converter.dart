import 'package:flutter_project_places/api/data/place_type_dto.dart';
import 'package:flutter_project_places/core/data/converter/converter.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_type_entity.dart';

/// Конвертер из [PlaceTypeDto] в [PlaceTypeEntity]
typedef IPlaceTypeDtoToEntityConverter = Converter<PlaceTypeEntity, PlaceTypeDto>;

/// Реализация [IPlaceTypeDtoToEntityConverter].
final class PlaceTypeDtoToEntityConverter extends IPlaceTypeDtoToEntityConverter {
  const PlaceTypeDtoToEntityConverter();

  @override
  PlaceTypeEntity convert(PlaceTypeDto input) {
    return switch (input) {
      PlaceTypeDto.other => PlaceTypeEntity.other,
      PlaceTypeDto.park => PlaceTypeEntity.park,
      PlaceTypeDto.monument => PlaceTypeEntity.monument,
      PlaceTypeDto.theatre => PlaceTypeEntity.theatre,
      PlaceTypeDto.museum => PlaceTypeEntity.museum,
      PlaceTypeDto.temple => PlaceTypeEntity.temple,
      PlaceTypeDto.hotel => PlaceTypeEntity.hotel,
      PlaceTypeDto.restaurant => PlaceTypeEntity.restaurant,
      PlaceTypeDto.cafe => PlaceTypeEntity.cafe,
      PlaceTypeDto.shopping => PlaceTypeEntity.shopping,
    };
  }
}
