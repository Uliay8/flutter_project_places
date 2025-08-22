import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:flutter_project_places/features/common/models/place.dart';
import 'package:flutter_project_places/features/place_detail/di/places_detail_dependencies.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_screen.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreenBuilder extends StatelessWidget {
  final Place place;
  const PlaceDetailScreenBuilder({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlacesDetailDependencies.providers(),
        Provider<IPlaceDetailWM>(
          create: (context) => PlaceDetailWM(
            context.read<IPlaceDetailModel>(),
            context.read<IFavoritesRepository>(),
            place,
          ),
        ),
      ],
      child: Builder(
        builder: (context) => PlaceDetailScreen(
          wm: context.read<IPlaceDetailWM>(),
          place: place,
        ),
      ),
    );
  }
}
