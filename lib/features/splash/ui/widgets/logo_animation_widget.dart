import 'package:flutter/material.dart';
import 'package:flutter_project_places/assets/images/app_svg_icons.dart';
import 'package:flutter_project_places/uikit/images/svg_picture_widget.dart';
import 'package:flutter_project_places/uikit/themes/colors/app_color_theme.dart';

class LogoAnimationWidget extends StatefulWidget {
  final VoidCallback? onAnimationComplete;
  
  const LogoAnimationWidget({super.key, this.onAnimationComplete});

  @override
  State<LogoAnimationWidget> createState() => _LogoAnimationWidgetState();
}

class _LogoAnimationWidgetState extends State<LogoAnimationWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = AppColorTheme.of(context).icon;

    return Center(
      child: Stack(
        children: [
          Center(
            child: SvgPictureWidget(
              AppSvgIcons.icSplashLogo,
              color: color,
              width: 150,
              height: 150,
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        color,
                        color,
                      ],
                      stops: [
                        _animation!.value,
                        0.05,
                        1.0,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: color,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
