import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/common/widgets/logo_widget.dart';

class HomeLogoWidget extends StatelessWidget {
  const HomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: const EdgeInsetsDirectional.all(8),
      margin: const EdgeInsetsDirectional.only(
        start: 30,
        top: kToolbarHeight + 30,
        end: 30,
        bottom: 30,
      ),
      child: LogoWidget(maxWidth: screenSize.width),
    );
  }
}
