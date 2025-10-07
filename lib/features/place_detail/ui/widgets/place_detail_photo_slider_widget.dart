import 'package:flutter/material.dart';
import 'package:flutter_project_places/uikit/themes/colors/app_color_theme.dart';

class PlaceDetailPhotoSliderWidget extends StatelessWidget {
  final List<String> images;
  final VoidCallback onBackPressed;

  const PlaceDetailPhotoSliderWidget({required this.images, required this.onBackPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final topPositionBackButton = MediaQuery.paddingOf(context).top + 16;

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
                      color: colorTheme.inactive,
                    ),
                  );
                },
              ),
              Positioned(
                left: 16,
                top: topPositionBackButton,
                child: CircleAvatar(
                  backgroundColor: colorTheme.scaffold,
                  child: IconButton(
                    onPressed: onBackPressed,
                    icon: Icon(
                      Icons.arrow_back,
                      color: colorTheme.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
