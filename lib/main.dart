import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/app.dart';
import 'package:olearis_test_task/app/app_view_model.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';
import 'package:provider/provider.dart';

void main() {
  final NavigationUtil navigationUtil = NavigationUtil();

  runApp(
    MultiProvider(
      providers: [
        Provider<NavigationUtil>.value(value: navigationUtil),
      ],
      child: ChangeNotifierProvider<AppViewModel>(
        create: (BuildContext context) {
          return AppViewModel(
            navigationUtil: navigationUtil,
          );
        },
        child: Consumer<AppViewModel>(
          builder: (context, model, child) {
            return App(
              viewModel: model,
            );
          },
        ),
      ),
    ),
  );
}
