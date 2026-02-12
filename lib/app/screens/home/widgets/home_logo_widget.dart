import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/common/widgets/logo_widget.dart';

class HomeLogoWidget extends StatelessWidget {
  const HomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsetsDirectional.all(8),
      child: const LogoWidget(),
    );
  }
}
