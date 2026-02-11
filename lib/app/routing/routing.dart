import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/route_constants.dart';

class Routing {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.routeAuth:
        return _buildAuthScreen(settings);
      case RouteConstants.routeHome:
        return _buildHomeScreen(settings);

      default:
        return _buildErrorScreen(settings);
    }
  }

  static PageRoute _buildAuthScreen(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        return SizedBox();
      },
    );
  }

  static PageRoute _buildHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        return SizedBox();
      },
    );
  }

  static PageRoute _buildErrorScreen(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(
              "Oops, seems like this page doesn't exist",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
