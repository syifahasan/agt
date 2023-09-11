import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double originalPrice;
  final double discountPercentage;

  Product({
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountPercentage,
  });

  double get discountedPrice =>
      originalPrice - (originalPrice * (discountPercentage / 100));
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'Description 1',
      originalPrice: 50.0,
      discountPercentage: 20.0,
    ),
    Product(
      name: 'Product 2',
      description: 'Description 2',
      originalPrice: 80.0,
      discountPercentage: 10.0,
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Discount Sale Market'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(product.name),
                subtitle: Text(product.description),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${product.originalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '\$${product.discountedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
