import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/images/app_svg_icons.dart';
import 'package:flutter_project_places/assets/strings/app_strings.dart';
import 'package:flutter_project_places/features/places/ui/screens/places_screen_builder.dart';
import 'package:flutter_project_places/uikit/images/svg_picture_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    const PlacesScreenBuilder(),
    const Center(child: Text(AppStrings.favoritesStub)),
    const Center(child: Text(AppStrings.settingsStub)),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icList),
            activeIcon: SvgPictureWidget(AppSvgIcons.icListFull),
            label: AppStrings.placesScreenBottomNavPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icFavorites),
            activeIcon: SvgPictureWidget(AppSvgIcons.icFavoritesFull),
            label: AppStrings.placesScreenBottomNavFavorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icSettings),
            activeIcon: SvgPictureWidget(AppSvgIcons.icSettingsFull),
            label: AppStrings.placesScreenBottomNavSettings,
          ),
        ],
      ),
    );
  }
}
