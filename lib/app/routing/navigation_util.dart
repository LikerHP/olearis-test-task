import 'package:flutter/cupertino.dart';

class NavigationUtil {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo<T extends Object?>(
    String routeName, {
    dynamic data,
  }) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
  }

  void navigateBack({dynamic data}) {
    navigatorKey.currentState!.pop(data);
  }
}
