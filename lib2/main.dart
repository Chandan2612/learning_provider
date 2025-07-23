// 🟨 main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';
import 'ui/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      home: const ProductScreen(),
    );
  }
}
