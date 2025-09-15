import 'package:flutter/foundation.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';

/// Состояние экрана детальной информации о месте.
/// Пока нигде не используется
@immutable
class PlaceDetailState {
  /// Место.
  final PlaceEntity place;

  const PlaceDetailState({required this.place});
}
