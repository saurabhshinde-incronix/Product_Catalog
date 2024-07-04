// // models/product.dart

// class Product {
//   final String name;
//   final String image;
//   final double price;

//   Product({required this.name, required this.image, required this.price});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       name: json['name'],
//       image: json['image'],
//       price: json['price'].toDouble(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'image': image,
//       'price': price,
//     };
//   }
// }


class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
    };
  }
}
