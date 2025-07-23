// 🟩 main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/provider.dart';
import 'package:provider_learning/ui/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TextListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Text Submit Demo',
      home: const HomeScreen(),
    );
  }
}
