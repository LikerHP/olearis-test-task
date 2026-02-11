import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';
import 'package:olearis_test_task/app/screens/auth/auth_screen.dart';
import 'package:olearis_test_task/app/screens/auth/auth_view_model.dart';
import 'package:olearis_test_task/domain/auth/auth_use_case.dart';
import 'package:provider/provider.dart';

class AuthFactory {
  static Widget build() {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (BuildContext context) {
        return AuthViewModel(
          authUseCase: context.read<AuthUseCase>(),
          navigationUtil: context.read<NavigationUtil>(),
        );
      },
      child: Consumer<AuthViewModel>(
        builder: (_, model, __) {
          return AuthScreen(
            viewModel: model,
          );
        },
      ),
    );
  }
}
