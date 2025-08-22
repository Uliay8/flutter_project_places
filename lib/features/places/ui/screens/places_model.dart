import 'package:flutter/foundation.dart';
import 'package:flutter_project_places/features/common/models/place.dart';

abstract class IPlacesModel {
  ValueListenable<List<Place>> get placesStateListenable;
  void dispose();
  Future<void> getPlaces();
}

class PlacesModel implements IPlacesModel {
  final _placesState = ValueNotifier<List<Place>>(_mockPlaces);

  @override
  void dispose() {
    _placesState.dispose();
  }

  @override
  Future<void> getPlaces() async {
    _placesState.value = _mockPlaces;
  }

  @override
  ValueListenable<List<Place>> get placesStateListenable => _placesState;
}

final _mockPlaces = [
  Place(
    name: 'Эрмитаж',
    description:
        "Центральный парк Москвы, одно из самых популярных мест отдыха горожан и туристов. Здесь есть аттракционы, зоны отдыха, набережная Москвы-реки, катки зимой и многое другое. В парке проводятся фестивали, концерты, выставки и другие мероприятия. Это отличное место для прогулок, занятий спортом и просто приятного времяпровождения на свежем воздухе в центре мегаполиса. Велосипеды и самокаты можно взять в аренду.",
    type: "парк",
    images: [
      "https://avatars.mds.yandex.net/i?id=62c6b7979919e4b7369a463f64b6d6d4_l-5873280-images-thumbs&n=13",
      "https://source.unsplash.com/1000x600?sig=2",
      "https://source.unsplash.com/1000x600?sig=3",
    ],
  ),
  Place(
    name: 'Парк Горького',
    description:
        "Один из крупнейших и самых известных художественных музеев мира, расположенный в Санкт-Петербурге. Его коллекции охватывают историю мирового искусства от древнейших времен до наших дней. Здесь можно увидеть шедевры живописи, скульптуры, графики, декоративно-прикладного искусства, археологические находки и многое другое. Эрмитаж – это не только музей, но и культурный центр мирового значения.",
    type: "музей",
    images: [
      "https://source.unsplash.com/1000x600?sig=4",
      "https://source.unsplash.com/1000x600?sig=5",
      "https://source.unsplash.com/1000x600?sig=6",
    ],
  ),
  Place(
    name: 'Кафе Пушкинъ',
    description:
        "Известное московское кафе с изысканной кухней и неповторимой атмосферой. Интерьер кафе стилизован под дворянскую усадьбу XIX века. В меню представлены блюда русской и французской кухни. Кафе славится своими десертами и выпечкой. Это прекрасное место для романтического ужина, деловой встречи или просто приятного отдыха в элегантной обстановке. Здесь вы окунетесь в атмосферу роскоши и комфорта.",
    type: "кафе",
    images: [
      "https://source.unsplash.com/1000x600?sig=7",
      "https://source.unsplash.com/1000x600?sig=8",
      "https://source.unsplash.com/1000x600?sig=9",
    ],
  ),
  Place(
    name: 'Парк Горького',
    description:
        "Один из крупнейших и самых известных художественных музеев мира, расположенный в Санкт-Петербурге. Его коллекции охватывают историю мирового искусства от древнейших времен до наших дней. Здесь можно увидеть шедевры живописи, скульптуры, графики, декоративно-прикладного искусства, археологические находки и многое другое. Эрмитаж – это не только музей, но и культурный центр мирового значения.",
    type: "музей",
    images: [
      "https://source.unsplash.com/1000x600?sig=4",
      "https://source.unsplash.com/1000x600?sig=5",
      "https://source.unsplash.com/1000x600?sig=6",
    ],
  ),
  Place(
    name: 'Кафе Пушкинъ',
    description:
        "Известное московское кафе с изысканной кухней и неповторимой атмосферой. Интерьер кафе стилизован под дворянскую усадьбу XIX века. В меню представлены блюда русской и французской кухни. Кафе славится своими десертами и выпечкой. Это прекрасное место для романтического ужина, деловой встречи или просто приятного отдыха в элегантной обстановке. Здесь вы окунетесь в атмосферу роскоши и комфорта.",
    type: "кафе",
    images: [
      "https://source.unsplash.com/1000x600?sig=7",
      "https://source.unsplash.com/1000x600?sig=8",
      "https://source.unsplash.com/1000x600?sig=9",
    ],
  ),
];
