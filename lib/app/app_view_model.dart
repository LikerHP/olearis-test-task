import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel({
    required NavigationUtil navigationUtil,
  }) : _navigationUtil = navigationUtil;

  final NavigationUtil _navigationUtil;

  GlobalKey<NavigatorState> get navigatorKey => NavigationUtil.navigatorKey;
}
