// // screens/wishlist_screen.dart

// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import '../services/wishlist_service.dart';

// class WishlistScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Wishlist')),
//       body: FutureBuilder(
//         future: WishlistService.getWishlist(),
//         builder: (context, AsyncSnapshot<List<Product>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<Product> wishlist = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: wishlist.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.network(wishlist[index].image, width: 50.0),
//                   title: Text(wishlist[index].name),
//                   subtitle: Text('\$${wishlist[index].price.toStringAsFixed(2)}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       WishlistService.removeFromWishlist(wishlist[index]);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Product removed from wishlist')),
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/wishlist_service.dart';
import '../widgets/product_item.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Future<List<Product>>? _wishlistFuture;

  @override
  void initState() {
    super.initState();
    _wishlistFuture = WishlistService.getWishlist();
  }

  void _refreshWishlist() {
    setState(() {
      _wishlistFuture = WishlistService.getWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: FutureBuilder(
        future: _wishlistFuture,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product> wishlist = snapshot.data ?? [];
            if (wishlist.isEmpty) {
              return Center(child: Text('No items in the wishlist'));
            }
            return ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(wishlist[index].image, width: 50.0),
                  title: Text(wishlist[index].name),
                  subtitle: Text('\$${wishlist[index].price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await WishlistService.removeFromWishlist(wishlist[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product removed from wishlist')),
                      );
                      _refreshWishlist();
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
