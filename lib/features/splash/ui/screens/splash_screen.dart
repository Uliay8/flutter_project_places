import 'package:flutter/material.dart';
import 'package:flutter_project_places/features/splash/ui/widgets/logo_animation_widget.dart';
import 'package:flutter_project_places/features/tabs_screen/tabs_screen.dart';
import 'package:flutter_project_places/uikit/themes/colors/app_color_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToTabsScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TabsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              colorTheme.splashEnd,
              colorTheme.splashEnd,
              colorTheme.splashStart,
            ],
          ),
        ),
        child: LogoAnimationWidget(
          onAnimationComplete: () => _navigateToTabsScreen(context),
        ),
      ),
    );
  }
}
