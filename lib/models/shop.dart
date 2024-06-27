import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier{

  // products for sale
    final List<Product> _shop = [
      // product 1
      Product(
          name: "Belt",
          price: 500,
          description: "Sleek leather belt for men",
          imagePath: 'assets/belt.png',
      ),

      // product 2
      Product(
        name: "Hoodie",
        price: 1200,
        description: "Stylish hoodie that fits with any style",
          imagePath: "assets/hoodie.png"
      ),

      // product 3
      Product(
        name: "Polo T-shirt",
        price: 800,
        description: "Polo t-shirt never gets old",
        imagePath: "assets/polo.png"
      ),

      // product 4
      Product(
        name: "Jordan 19",
        price: 3500,
        description: "A Jordan 19 is what you need",
        imagePath: "assets/sneaker.png"
      ),
    ];

  // user cart
final List<Product> _cart = [];

  // get product
List<Product> get shop => _shop;
  // get user cart
List<Product> get cart => _cart;

  // add item to cart
void addToCart(Product item){
  _cart.add(item);
  notifyListeners();
}

  //remove item from cart
void removeFromCart(Product item){
  _cart.remove(item);
  notifyListeners();
}
}