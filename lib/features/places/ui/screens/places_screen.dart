import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/strings/app_strings.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:flutter_project_places/features/common/models/place.dart';
import 'package:flutter_project_places/features/places/ui/screens/places_wm.dart';
import 'package:flutter_project_places/features/places/ui/widgets/place_card_widget.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
  final IPlacesWM wm;
  const PlacesScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<Place>>(
        valueListenable: wm.placesStateListenable,
        builder: (context, places, _) {
          return NestedScrollView(
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                title: const Text(AppStrings.placesScreenAppBarTitle),
                centerTitle: true,
              ),
            ],
            body: RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: places.isEmpty
                  ? Center(
                      child: Text(AppStrings.placesScreenNoPlaces),
                    )
                  : Builder(
                      builder: (context) {
                        final favoritesRepository = context.read<IFavoritesRepository>();
                        return ValueListenableBuilder(
                          valueListenable: favoritesRepository.favoritesListenable,
                          builder: (context, favorites, _) {
                            return ListView.separated(
                              padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
                              itemCount: places.length,
                              itemBuilder: (context, index) {
                                final place = places[index];
                                final isFavorite = favorites.any((f) => f.name == place.name);
                                return PlaceCardWidget(
                                  place: place,
                                  onCardTap: () {
                                    wm.onPlacePressed(context, place);
                                  },
                                  onLikeTap: () {
                                    wm.onLikePressed(place);
                                  },
                                  isFavorite: isFavorite,
                                );
                              },
                              separatorBuilder: (_, __) => const SizedBox(height: 24),
                            );
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
