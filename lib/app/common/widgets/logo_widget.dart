import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: const ValueKey('logo_hero_key'),
      child: SvgPicture.asset(
        'assets/olearis_logo.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}
