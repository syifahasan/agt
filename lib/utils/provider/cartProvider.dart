import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;
  double get totalPrice => _items.fold(0.0, (total, item) => total + item.price);

  void addToCart(CartItem newItem){
    _items.add(newItem);
    notifyListeners();
  }

  void removeFromCart(String itemId){
    _items.removeWhere((item )=> item.id == itemId);
  }
}

class CartItem {
  final String id;
  final String itempic;
  final double price;
  final String itemname;
  final List<Color> colors;
  final String selectedSize;

  CartItem({
    String? id,
    required this.itempic,
    required this.price,
    required this.itemname,
    required this.colors,
    required this.selectedSize,
  }) : id = id ?? Uuid().v4();
}