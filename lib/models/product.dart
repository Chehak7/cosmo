import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final int discountPercent;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final List<Color> shades;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.discountPercent,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.shades,
    required this.description,
  });

  double get originalPrice => price / (1 - (discountPercent / 100));
}

final List<Product> dummyProducts = [
  // Skincare
  Product(
    id: '1',
    name: 'Midnight Recovery Face Oil',
    brand: 'Luxe Skin',
    category: 'Skincare',
    price: 45.00,
    discountPercent: 10,
    imageUrl: 'assets/images/face_serum_product.png',
    rating: 4.8,
    reviewCount: 1250,
    shades: [],
    description: 'A potent nightly repair oil that restores skin radiance and firmness while you sleep.',
  ),
  Product(
    id: '2',
    name: 'Vitamin C Brightening Serum',
    brand: 'Glow Co.',
    category: 'Skincare',
    price: 38.00,
    discountPercent: 0,
    imageUrl: 'assets/images/face_serum_product.png',
    rating: 4.6,
    reviewCount: 890,
    shades: [],
    description: 'Advanced antioxidant serum that visibly brightens skin tone and reduces dark spots.',
  ),
  Product(
    id: '3',
    name: 'Hyaluronic Hydra Gel',
    brand: 'Aqua Pure',
    category: 'Skincare',
    price: 32.00,
    discountPercent: 15,
    imageUrl: 'assets/images/hydra_gel_product.png',
    rating: 4.9,
    reviewCount: 2100,
    shades: [],
    description: 'Extra-hydrating gel cream that locks in moisture for 72 hours of plump, dewy skin.',
  ),

  // Makeup
  Product(
    id: '4',
    name: 'Velvet Matte Lipstick',
    brand: 'Rouge Luxe',
    category: 'Makeup',
    price: 24.00,
    discountPercent: 20,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.7,
    reviewCount: 3400,
    shades: [Colors.red, Colors.pink, Colors.brown, Colors.orange],
    description: 'Highly pigmented matte lipstick with a weightless, velvet-smooth finish.',
  ),
  Product(
    id: '5',
    name: 'Silk Finish Foundation',
    brand: 'Skin Glow',
    category: 'Makeup',
    price: 42.00,
    discountPercent: 0,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.5,
    reviewCount: 1560,
    shades: [Color(0xFFF3E5AB), Color(0xFFE1C16E), Color(0xFFCD7F32)],
    description: 'Medium coverage foundation with a natural skin-like finish and SPF 20 protection.',
  ),
  Product(
    id: '6',
    name: 'Starlight Highlighter Palette',
    brand: 'Glow Co.',
    category: 'Makeup',
    price: 35.00,
    discountPercent: 10,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.8,
    reviewCount: 720,
    shades: [Colors.white70, Color(0xFFFFD700)],
    description: 'Ultra-fine shimmer powders that create an ethereal, lit-from-within glow.',
  ),

  // Perfume
  Product(
    id: '7',
    name: 'Midnight Muse Eau de Parfum',
    brand: 'Essence',
    category: 'Perfume',
    price: 85.00,
    discountPercent: 0,
    imageUrl: 'assets/images/perfume_product.png',
    rating: 4.9,
    reviewCount: 540,
    shades: [],
    description: 'A sophisticated blend of dark jasmine, black coffee, and vanilla beans.',
  ),
  Product(
    id: '8',
    name: 'Ocean Breeze Mist',
    brand: 'Essence',
    category: 'Perfume',
    price: 65.00,
    discountPercent: 25,
    imageUrl: 'assets/images/perfume_product.png',
    rating: 4.4,
    reviewCount: 1100,
    shades: [],
    description: 'Light, airy fragrance inspired by the Mediterranean coast and sea salt.',
  ),
  Product(
    id: '9',
    name: 'Rosé Garden Nectar',
    brand: 'Pure Bloom',
    category: 'Perfume',
    price: 78.00,
    discountPercent: 10,
    imageUrl: 'assets/images/perfume_product.png',
    rating: 4.7,
    reviewCount: 920,
    shades: [],
    description: 'Delicate floral fragrance featuring blooming Damask Roses and fresh Peony.',
  ),

  // Lip Care
  Product(
    id: '10',
    name: 'Honey Glaze Lip Mask',
    brand: 'Nectar Skin',
    category: 'Lip Care',
    price: 18.00,
    discountPercent: 5,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.8,
    reviewCount: 2800,
    shades: [],
    description: 'Leave-on lip mask that melts into lips for ultimate softness and repair.',
  ),
  Product(
    id: '11',
    name: 'Berry Tinted Lip Balm',
    brand: 'Pure Bloom',
    category: 'Lip Care',
    price: 14.00,
    discountPercent: 0,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.6,
    reviewCount: 4100,
    shades: [Colors.redAccent, Colors.purpleAccent],
    description: 'Daily hydrating balm with a sheer hint of color and natural berry extract.',
  ),
  Product(
    id: '12',
    name: 'Cooling Mint Lip Scrub',
    brand: 'Aqua Pure',
    category: 'Lip Care',
    price: 16.00,
    discountPercent: 0,
    imageUrl: 'assets/images/lipstick_product.png',
    rating: 4.5,
    reviewCount: 650,
    shades: [],
    description: 'Gentle sugar scrub that exfoliates and refreshes for smooth, hydrated lips.',
  ),
];

class Category {
  final String name;
  final String icon;

  Category({required this.name, required this.icon});
}

