import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/strings/app_strings.dart';
import 'package:flutter_project_places/features/common/domain/entities/place_entity.dart';
import 'package:flutter_project_places/uikit/themes/colors/app_color_theme.dart';
import 'package:flutter_project_places/uikit/themes/text/app_text_theme.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final PlaceEntity place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final PlaceCardType cardType;
  final bool isFavorite;

  const PlaceCardWidget({
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    required this.isFavorite,
    super.key,
  });

  static const _cardHeight = 190.0;
  static const _imageHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return SizedBox(
      height: _cardHeight,
      child: Material(
        color: colorTheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _imageHeight,
                      child: Image.network(
                        place.images.firstWhere((_) => true, orElse: () => ''),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Center(
                          child: Text(AppStrings.noPhoto),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.placeType.name.toLowerCase(),
                        style: textTheme.smallBold.copyWith(color: colorTheme.neutralWhite),
                      ),
                    ),
                  ],
                ),
                //Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: textTheme.small.copyWith(color: colorTheme.textSecondaryVariant),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onCardTap),
              ),
            ),
            Positioned(
              top: 8,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? colorTheme.favorite : colorTheme.neutralWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
