import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/strings/app_strings.dart';
import 'package:flutter_project_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:flutter_project_places/features/common/models/place.dart';
import 'package:flutter_project_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:flutter_project_places/uikit/buttons/main_button.dart';
import 'package:flutter_project_places/uikit/themes/colors/app_color_theme.dart';
import 'package:flutter_project_places/uikit/themes/text/app_text_theme.dart';
import 'package:flutter_project_places/features/place_detail/ui/widgets/heart_animation_widget.dart';
import 'package:flutter_project_places/features/place_detail/ui/widgets/place_detail_content_widget.dart';
import 'package:flutter_project_places/features/place_detail/ui/widgets/place_detail_photo_slider_widget.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  final IPlaceDetailWM wm;
  final Place place;

  const PlaceDetailScreen({
    required this.wm,
    required this.place,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 360,
                flexibleSpace: PlaceDetailPhotoSliderWidget(
                  images: place.images,
                  onBackPressed: () {
                    wm.onBackPressed(context);
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PlaceDetailContentWidget(place: place),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MainButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.route,
                            color: colorTheme.icon,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppStrings.placeDetailsRouteButton,
                            style: textTheme.button.copyWith(color: colorTheme.neutralWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Builder(
                        builder: (context) {
                          final favoritesRepository = context.read<IFavoritesRepository>();
                          return ValueListenableBuilder(
                            valueListenable: favoritesRepository.favoritesListenable,
                            builder: (context, favorites, _) {
                              final isFavorite = favorites.any((f) => f.name == place.name);
                              return TextButton.icon(
                                onPressed: wm.onLikePressed,
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? colorTheme.favorite : colorTheme.textSecondary,
                                ),
                                label: Text(
                                  isFavorite
                                      ? AppStrings.placeDetailsInFavoritesButton
                                      : AppStrings.placeDetailsFavoritesButton,
                                  style: textTheme.text.copyWith(color: colorTheme.textSecondary),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SafeArea(child: SizedBox.shrink()),
                ]),
              ),
            ],
          ),
          HeartAnimationWidget(key: wm.heartAnimationKey),
        ],
      ),
    );
  }
}
