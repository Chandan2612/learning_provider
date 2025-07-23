import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("🛒 Products")),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text("₹${product.price}"),
                  trailing: Selector<ProductProvider, int>(
                    selector: (context, value) => value.products[index].id,
                    builder: (context, counterValue, child) {
                      return Text("🔢 Count: $counterValue");
                    },
                  ),
                );
              },
            ),
    );
  }
}
