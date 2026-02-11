import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/routing/navigation_util.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required NavigationUtil navigationUtil,
  }) : _navigationUtil = navigationUtil;

  final NavigationUtil _navigationUtil;

  final List<String> _items = [];

  List<String> get items => _items;

  void onBackPressed() {
    _navigationUtil.navigateBack();
  }

  void onAddItem() {
    _items.add('Item ${_items.length}');
    notifyListeners();
  }

  void onRemoveItem() {
    if (_items.isNotEmpty) {
      _items.removeLast();
      notifyListeners();
    }
  }
}
