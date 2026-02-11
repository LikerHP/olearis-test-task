import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';
import 'package:olearis_test_task/app/routing/route_constants.dart';
import 'package:olearis_test_task/domain/auth/auth_use_case.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required AuthUseCase authUseCase,
    required NavigationUtil navigationUtil,
  })  : _authUseCase = authUseCase,
        _navigationUtil = navigationUtil;

  final AuthUseCase _authUseCase;
  final NavigationUtil _navigationUtil;

  String _login = '';
  String _password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isContinueActive => _login.isNotEmpty && _password.isNotEmpty;

  void onLoginEntered(String text) {
    if (text.trim().isNotEmpty) {
      _login = text.trim();
      notifyListeners();
    }
  }

  void onPasswordEntered(String text) {
    if (text.trim().isNotEmpty) {
      _password = text.trim();
      notifyListeners();
    }
  }

  Future<void> onContinuePressed() async {
    _isLoading = true;
    notifyListeners();

    final bool isSuccess = await _authUseCase.call(
      login: _login,
      password: _password,
    );

    if (isSuccess) {
      _navigationUtil.navigateTo(RouteConstants.routeHome);
    }

    _isLoading = false;
    notifyListeners();
  }
}
