// 🟩 product_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../services/class_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final Logger _logger = Logger();

  Future<void> fetchProducts() async {
    _isLoading = true;
    _logger.i("🔄 loading is on"); // ✅ Info log
    await Future.delayed(const Duration(seconds: 5));
    notifyListeners(); // 🔔 show loader

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = json.decode(response.body);
      final List productsJson = data['products'];

      _products = productsJson.map((e) => Product.fromJson(e)).toList();
      _logger.i("✅ Data successfully parsed. Count: ${_products.length}");
      _isLoading = false;
      notifyListeners(); // 🔔 notify UI update
    } catch (e, stackTrace) {
      _logger.e('❌ Error while fetching products', error: e, stackTrace: stackTrace);
    } finally {
      // _isLoading = false;
      // _logger.i("✅ loading is off, data fetched");
      // notifyListeners(); // 🔔 notify UI update
    }
  }
}
