// // services/wishlist_service.dart

// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import '../models/product.dart';

// class WishlistService {
//   static const _key = 'wishlist';

//   static Future<List<Product>> getWishlist() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? wishlistJson = prefs.getStringList(_key);
//     if (wishlistJson == null) return [];
//     return wishlistJson.map((e) => Product.fromJson(jsonDecode(e))).toList();
//   }

//   static Future<void> addToWishlist(Product product) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> wishlistJson = prefs.getStringList(_key) ?? [];
//     wishlistJson.add(jsonEncode(product));
//     await prefs.setStringList(_key, wishlistJson);
//   }

//   static Future<void> removeFromWishlist(Product product) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> wishlistJson = prefs.getStringList(_key) ?? [];
//     wishlistJson.removeWhere((element) => element == jsonEncode(product));
//     await prefs.setStringList(_key, wishlistJson);
//   }
// }


import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product.dart';

class WishlistService {
  static const _key = 'wishlist';

  static Future<List<Product>> getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? wishlistJson = prefs.getStringList(_key);
    if (wishlistJson == null) return [];
    return wishlistJson.map((e) => Product.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> addToWishlist(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlistJson = prefs.getStringList(_key) ?? [];
    wishlistJson.add(jsonEncode(product.toJson()));
    await prefs.setStringList(_key, wishlistJson);
  }

  static Future<void> removeFromWishlist(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlistJson = prefs.getStringList(_key) ?? [];
    wishlistJson.removeWhere((element) => jsonDecode(element)['name'] == product.name);
    await prefs.setStringList(_key, wishlistJson);
  }
}
