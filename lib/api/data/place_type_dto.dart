import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PlaceTypeDto {
  /// Другое
  @JsonValue('other')
  other('other'),

  /// Парк.
  @JsonValue('park')
  park('park'),

  /// Памятник.
  @JsonValue('monument')
  monument('monument'),

  /// Театр.
  @JsonValue('theatre')
  theatre('theatre'),

  /// Музей.
  @JsonValue('museum')
  museum('museum'),

  /// Храм.
  @JsonValue('temple')
  temple('temple'),

  /// Отель.
  @JsonValue('hotel')
  hotel('hotel'),

  /// Ресторан.
  @JsonValue('restaurant')
  restaurant('restaurant'),

  /// Кафе.
  @JsonValue('cafe')
  cafe('cafe'),

  /// Магазин.
  @JsonValue('shopping')
  shopping('shopping');

  final String? json;

  const PlaceTypeDto(this.json);

  String? toJson() => json;

  factory PlaceTypeDto.fromJson(String json) {
    return values.firstWhere((value) => value.json == json, orElse: () => other);
  }
}
