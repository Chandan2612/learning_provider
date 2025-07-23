// 🟩 product_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../helper/logger.dart';
import '../services/class_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  bool _isError = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  // final Logger _logger = Logger();
  final Logger _logger = Logger(
    printer: CustomColorLogPrinter(),
  );

  Future<void> fetchProducts() async {
    _isLoading = true;
    _logger.i(" loading is on"); // ✅ Info log
    await Future.delayed(const Duration(seconds: 5));
    notifyListeners(); // 🔔 show loader

    try {
      final response = await http.get(Uri.parse('https://dummyjson.om/products'));
      final data = json.decode(response.body);
      final List productsJson = data['products'];

      _products = productsJson.map((e) => Product.fromJson(e)).toList();
      _logger.i(" Data successfully parsed. Count: ${_products.length}");
      _isLoading = false;
      notifyListeners(); // 🔔 notify UI update
    } catch (e, stackTrace) {
      _logger.e(' Error while fetching products', error: e, stackTrace: stackTrace);
      _isLoading = false;
      _isError = true;

      notifyListeners(); // 🔔 notify UI update
    } finally {
      // _isLoading = false;
      // _logger.i(" loading is off, data fetched");
      // notifyListeners(); // 🔔 notify UI update
    }
  }
}
