// // main_screen.dart
// import 'package:flutter/material.dart';
// import '../widgets/product_item.dart'; // Adjust import as per your project structure
// import '../models/product.dart';
// import '../screens/wishlist_screen.dart'; // Adjust import as per your project structure

// class MainScreen extends StatelessWidget {
//   final List<Product> products = [
//     Product(name: 'Product 1', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 10.0),
//     Product(name: 'Product 2', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 20.0),
//     Product(name: 'Product 3', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 30.0),
//     // Add more products as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Product Catalogue')),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ProductItem(product: products[index]);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
//         },
//         label: Text('Wishlist'),
//         icon: Icon(Icons.favorite),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../models/product.dart';
import 'wishlist_screen.dart';
import '../services/wishlist_service.dart';

class MainScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 10.0),
    Product(name: 'Product 2', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 20.0),
    Product(name: 'Product 3', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 30.0),
    Product(name: 'Product 4', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 40.0),
    Product(name: 'Product 5', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 50.0),
    Product(name: 'Product 6', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 60.0),
    Product(name: 'Product 7', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 70.0),
    Product(name: 'Product 8', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 80.0),
    Product(name: 'Product 9', image: 'https://in-media.apjonlinecdn.com/catalog/product/cache/b3b166914d87ce343d4dc5ec5117b502/c/0/c08192495_1_9.png', price: 90.0)
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Catalogue')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
        },
        label: Text('Wishlist'),
        icon: Icon(Icons.favorite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


