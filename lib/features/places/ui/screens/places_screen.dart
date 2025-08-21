import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/strings/app_strings.dart';
import 'package:flutter_project_places/models/place.dart';
import 'package:flutter_project_places/features/places/ui/widgets/place_card_widget.dart';

class PlacesScreen extends StatelessWidget {
  final List<Place> places;
  const PlacesScreen({required this.places, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.placesScreenAppBarTitle),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return PlaceCardWidget(
            place: place,
            onCardTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text('${AppStrings.cardTapSnackbar} "${place.name.toString()}"'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            onLikeTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text('${AppStrings.likeTapSnackbar} "${place.name.toString()}"'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: AppStrings.placesScreenBottomNavPlaces),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: AppStrings.placesScreenBottomNavFavorites),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: AppStrings.placesScreenBottomNavSettings),
        ],
        onTap: (_) {},
      ),
    );
  }
}
