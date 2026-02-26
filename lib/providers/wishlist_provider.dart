import 'package:flutter/material.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlistItems = [];

  List<Product> get items => [..._wishlistItems];

  bool isFavorite(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }

  void toggleFavorite(Product product) {
    final index = _wishlistItems.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _wishlistItems.removeAt(index);
    } else {
      _wishlistItems.add(product);
    }
    notifyListeners();
  }

  void clear() {
    _wishlistItems.clear();
    notifyListeners();
  }
}
