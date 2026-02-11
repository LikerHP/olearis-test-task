import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';
import 'package:olearis_test_task/app/screens/home/home_screen.dart';
import 'package:olearis_test_task/app/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) {
        return HomeViewModel(
          navigationUtil: context.read<NavigationUtil>(),
        );
      },
      child: Consumer<HomeViewModel>(
        builder: (_, model, __) {
          return HomeScreen(
            viewModel: model,
          );
        },
      ),
    );
  }
}
