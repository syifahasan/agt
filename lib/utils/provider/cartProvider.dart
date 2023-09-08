import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  double _totalPrice = 0.0;

  List<CartItem> get items => _items;
  double get totalPrice => _totalPrice;

  // double get totalPrice {
  //   double total = 0.0;
  //   for (var item in _items) {
  //     if (item.isChecked) {
  //       total += double.parse(item.price.toString());
  //     }
  //   }
  //   return total;
  // }
  void updateTotalPrice() {
    _totalPrice = calculateTotalPrice();
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in _items) {
      if (item.isChecked) {
        total += item.getTotalPrice();
      }
    }
    return total;
  }

  void addToCart(CartItem newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void removeFromCart(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
    print('Total Price: ${totalPrice}');
  }
}

class CartItem {
  final String id;
  final String itempic;
  final double price;
  final String itemname;
  final List<Color> colors;
  final String selectedSize;
  bool isChecked;
  int quantity;
  final Function() onCheckedChanged;

  void setChecked(bool checked) {
    isChecked = checked;
    onCheckedChanged(); // Notify listeners about the change
  }

  double getTotalPrice() {
    return price * quantity;
  }

  CartItem({
    String? id,
    required this.itempic,
    required this.price,
    required this.itemname,
    required this.colors,
    required this.selectedSize,
    required this.onCheckedChanged,
    this.isChecked = false,
    this.quantity = 1,
  }) : id = id ?? Uuid().v4();
}
