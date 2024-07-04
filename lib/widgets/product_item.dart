// // widgets/product_item.dart

// import 'package:flutter/material.dart';
// import '../models/product.dart';

// class ProductItem extends StatelessWidget {
//   final Product product;

//   ProductItem({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(product.image, fit: BoxFit.cover, height: 150.0),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 5.0),
//                 Text('\$${product.price.toStringAsFixed(2)}'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/wishlist_service.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image, fit: BoxFit.cover, height: 150.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5.0),
                Text('\$${product.price.toStringAsFixed(2)}'),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () async {
                    await WishlistService.addToWishlist(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product added to wishlist')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
