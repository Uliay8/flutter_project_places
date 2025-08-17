import 'package:flutter/material.dart';

class PlaceDetailPhotoSliderWidget extends StatelessWidget {
  final List<String> images;
  final VoidCallback onBackPressed;
  const PlaceDetailPhotoSliderWidget({required this.images, required this.onBackPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade300,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
