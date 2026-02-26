import '../models/product.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;
  final Color? selectedShade;

  CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
    this.selectedShade,
  });
}
