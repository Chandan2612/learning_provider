
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController(); // 📥 Controller

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextListProvider>(context); // 🎯 Access provider

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Text Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔤 Text Input
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // 🔘 Submit Button
            ElevatedButton(
              onPressed: () {
                textProvider.addItem(_controller.text); // ✅ Add to provider list
                _controller.clear(); // 🧹 Clear input
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 24),

            // 📋 List of submitted items
            Expanded(
              child: Consumer<TextListProvider>(
                builder: (context, provider, _) => ListView.builder(
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(provider.items[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
