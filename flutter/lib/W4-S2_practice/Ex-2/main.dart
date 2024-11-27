import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          backgroundColor: Colors.blue[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: Product.values.map((product) => ProductCard(product: product)).toList(),
          ),
        ),
      ),
    );
  }
}

enum Product {
  dart('Dart', 'The best object language', 'asset/dart.png'),
  flutter('Flutter', 'The best mobile widget library', 'asset/flutter.png'),
  firebase('Firebase', 'The best cloud database', 'asset/firebase.png');

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              height: 60,
              width: 60,
            ),
            SizedBox(height: 5, width:double.infinity),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,width: double.infinity,),
            Text(
              product.description,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
