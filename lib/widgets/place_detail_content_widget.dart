import 'package:flutter/material.dart';
import 'package:flutter_project_places/models/place.dart';

class PlaceDetailContentWidget extends StatelessWidget {
  final Place place;
  const PlaceDetailContentWidget({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(place.name),
        const SizedBox(height: 2),
        Text(place.type),
        const SizedBox(height: 24),
        Text(place.description),
      ],
    );
  }
}
