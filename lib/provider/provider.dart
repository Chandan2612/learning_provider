// 🟦 text_list_provider.dart
import 'dart:developer';

import 'package:flutter/material.dart';

class TextListProvider with ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String text) {
    if (text.trim().isEmpty) return;
    _items.add(text.trim());
    notifyListeners();
    log("added ");
  }
}
