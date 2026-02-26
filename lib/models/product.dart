import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final String category;
  final String description;
  final List<Color>? colors;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.category,
    required this.description,
    this.colors,
  });
}

class Category {
  final String name;
  final String icon;

  Category({required this.name, required this.icon});
}
