import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({required this.maxWidth, super.key});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey('logo_hero_key'),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 375,
          maxHeight: 100,
        ),
        child: SvgPicture.asset(
          'assets/olearis_logo.svg',
          fit: BoxFit.contain,
          width: maxWidth,
        ),
      ),
    );
  }
}
