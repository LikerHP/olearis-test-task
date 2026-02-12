import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/common/widgets/app_text_field.dart';
import 'package:olearis_test_task/app/common/widgets/logo_widget.dart';
import 'package:olearis_test_task/app/screens/auth/auth_view_model.dart';
import 'package:olearis_test_task/app/screens/auth/widgets/continue_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({required this.viewModel, super.key});

  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(context);
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final bool isKeyboardVisible = viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenSize.height -
                  viewPadding.top -
                  kToolbarHeight -
                  viewInsets.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: isLandscape ? 56 : 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: 100,
                        maxWidth: 375,
                      ),
                      child: SizedBox(
                        width: screenSize.width,
                        child: LogoWidget(),
                      ),
                    ),
                    const Spacer(),
                    AppTextField(
                      labelText: 'Login',
                      onChanged: viewModel.onLoginEntered,
                    ),
                    AppTextField(
                      labelText: 'Password',
                      onChanged: viewModel.onPasswordEntered,
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 24,
                        bottom:
                            24 + (isKeyboardVisible ? 0 : viewPadding.bottom),
                      ),
                      child: ContinueButton(
                        isLoading: viewModel.isLoading,
                        isActive: viewModel.isContinueActive,
                        onPressed: viewModel.onContinuePressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
