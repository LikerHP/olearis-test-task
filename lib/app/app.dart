import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/app_view_model.dart';
import 'package:olearis_test_task/app/routing/route_constants.dart';
import 'package:olearis_test_task/app/routing/routing.dart';
import 'package:olearis_test_task/app/theme/theme.dart';

class App extends StatelessWidget {
  const App({required this.viewModel, super.key});

  final AppViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olearis Test Task',
      theme: getTheme(),
      navigatorKey: viewModel.navigatorKey,
      onGenerateRoute: Routing.onGenerateRoute,
      initialRoute: RouteConstants.routeAuth,
    );
  }
}
