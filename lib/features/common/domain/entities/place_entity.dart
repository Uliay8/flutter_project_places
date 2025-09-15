import 'package:equatable/equatable.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_type_entity.dart';

/// Сущность места.
class PlaceEntity extends Equatable {
  /// Уникальный идентификатор
  final int id;

  /// Название
  final String name;

  /// Описание
  final String description;

  /// Список URL изображений
  final List<String> images;

  /// Широта
  final double lat;

  /// Долгота
  final double lon;

  /// Тип места
  final PlaceTypeEntity placeType;

  /// Сущность места.
  const PlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.lat,
    required this.lon,
    required this.placeType,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    images,
    lat,
    lon,
    placeType,
  ];
}
