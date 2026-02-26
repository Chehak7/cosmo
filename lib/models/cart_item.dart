import '../models/product.dart';
import 'package:flutter/material.dart';

class CartItem {
  final Product product;
  int quantity;
  final Color? selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedColor,
  });
}
