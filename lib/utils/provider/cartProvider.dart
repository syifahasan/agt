import 'package:flutter/foundation.dart';
import 'package:authentic_guards/pages/store/myCart.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addToCart(CartItem newItem){
    _items.add(newItem);
    notifyListeners();
  }

  void removeFromCart(String itemId){
    _items.removeWhere((item )=> item.id == itemId);
  }
}