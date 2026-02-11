import 'package:flutter/material.dart';

class OrientationScreenWrapper extends StatelessWidget {
  const OrientationScreenWrapper({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, Orientation orientation) => body,
    );
  }
}
