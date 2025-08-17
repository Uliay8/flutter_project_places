import 'package:flutter/material.dart';
import 'package:flutter_project_places/models/place.dart';
import 'package:flutter_project_places/widgets/place_detail_content_widget.dart';
import 'package:flutter_project_places/widgets/place_detail_photo_slider_widget.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;
  final bool isFavorite;
  const PlaceDetailScreen({
    required this.place,
    required this.isFavorite,
    super.key,
  });

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _handleLike() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 360,
                flexibleSpace: PlaceDetailPhotoSliderWidget(images: widget.place.images, onBackPressed: () {}),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PlaceDetailContentWidget(place: widget.place),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("hi"),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
