import 'package:flutter/material.dart';
import 'package:flutter_project_places/models/place.dart';
import 'package:flutter_project_places/widgets/place_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mockplace = Place(
      name: 'Эрмитаж',
      description:
          "Один из крупнейших и самых известных художественных музеев мира, расположенный в Санкт-Петербурге. Его коллекции охватывают историю мирового искусства от древнейших времен до наших дней. Здесь можно увидеть шедевры живописи, скульптуры, графики, декоративно-прикладного искусства, археологические находки и многое другое. Эрмитаж – это не только музей, но и культурный центр мирового значения.",
      type: "museum",
      images: [
        "https://avatars.mds.yandex.net/i?id=62c6b7979919e4b7369a463f64b6d6d4_l-5873280-images-thumbs&n=13",
        "https://source.unsplash.com/1000x600?sig=2",
        "https://source.unsplash.com/1000x600?sig=3",
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PlaceCardWidget(
          place: mockplace,
          onCardTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Тап по карточке")));
          },
          onLikeTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Тап по лайку")));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: "Места"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Избранное"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Настройки"),
        ],
        onTap: (_) {},
      ),
    );
  }
}
