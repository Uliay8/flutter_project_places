import 'package:equatable/equatable.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';

/// Сущность, комбинирующая информацию о [PlaceEntity] и показывающее добавлено ли оно в избранное.
class LikedPlaceEntity extends Equatable {
  const LikedPlaceEntity({required this.place, required this.isFavorite});

  /// Место.
  final PlaceEntity place;

  /// Флаг, указывающий, добавлено ли место в избранное.
  final bool isFavorite;

  @override
  List<Object?> get props => [place, isFavorite];
}
