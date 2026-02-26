import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import '../core/theme.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _selectedCategory = 'All';
  String _sortBy = 'Popularity';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Skincare',
    'Makeup',
    'Perfume',
    'Haircare',
    'Lip Care'
  ];

  final List<String> _sortOptions = [
    'Popularity',
    'Price: Low to High',
    'Price: High to Low',
    'New Arrivals'
  ];

  final List<Product> _allProducts = [
    Product(
      id: '1',
      name: 'Aura Revival Serum',
      brand: 'AURA BOTANICS',
      price: 85.00,
      originalPrice: 105.00,
      imageUrl: 'assets/images/face_serum_product.png',
      rating: 4.8,
      reviewsCount: 124,
      category: 'Skincare',
      description: 'Experience the power of cellular regeneration with our Aura Revival Serum. Formulated with rare botanical extracts and advanced peptides, this luxurious serum penetrates deep to restore radiance, firm skin, and reduce fine lines for a youthful glow.',
      colors: [const Color(0xFFF3E5F5), const Color(0xFFE1BEE7)],
    ),
    Product(
      id: '2',
      name: 'Velvet Matte Lipstick',
      brand: 'LOURÈ',
      price: 32.00,
      imageUrl: 'assets/images/lipstick_product.png',
      rating: 4.5,
      reviewsCount: 89,
      category: 'Makeup',
      description: 'Drench your lips in creamy, high-pigment color with a sophisticated matte finish. Our Velvet Matte Lipstick stays comfortable all day without drying, providing a weightless feel and a flawless look.',
      colors: [const Color(0xFFB71C1C), const Color(0xFF880E4F), const Color(0xFF4A148C)],
    ),
    Product(
      id: '3',
      name: 'Midnight Bloom Parfum',
      brand: 'ESPRIT',
      price: 120.00,
      originalPrice: 150.00,
      imageUrl: 'assets/images/perfume_product.png',
      rating: 4.9,
      reviewsCount: 215,
      category: 'Perfume',
      description: 'Capture the essence of mysterious elegance. Midnight Bloom is a captivating blend of dark florals, amber, and exotic wood, creating a scent that lingers beautifully from dusk until dawn.',
    ),
    Product(
      id: '4',
      name: 'Rose Glow Palette',
      brand: 'COSMO LUXE',
      price: 65.00,
      imageUrl: 'assets/images/lipstick_product.png',
      rating: 4.6,
      reviewsCount: 56,
      category: 'Makeup',
      description: 'Achieve that perfect sun-kissed radiance with our Golden Hour palette. This versatile collection features warm bronzers, highlighters, and shimmering shadows to enhance your natural beauty.',
    ),
    Product(
      id: '5',
      name: 'Hydra Glow Moisturizer',
      brand: 'AURA BOTANICS',
      price: 55.00,
      imageUrl: 'assets/images/face_serum_product.png',
      rating: 4.7,
      reviewsCount: 142,
      category: 'Skincare',
      description: 'A deep-sea moisturizing complex that delivers intense hydration for up to 24 hours. Formulated with hyaluronic acid and mineral-rich sea salts.',
    ),
    Product(
      id: '6',
      name: 'Silk Finish Foundation',
      brand: 'LOURÈ',
      price: 45.00,
      imageUrl: 'assets/images/face_serum_product.png',
      rating: 4.4,
      reviewsCount: 67,
      category: 'Makeup',
      description: 'A buildable, medium-to-full coverage foundation that mimics the texture of natural skin with a silky, luminous finish.',
      colors: [const Color(0xFFF5E0D0), const Color(0xFFE5C1A7), const Color(0xFFD4A385)],
    ),
    Product(
      id: '7',
      name: 'Rose Water Toner',
      brand: 'COSMO NATURALS',
      price: 28.00,
      imageUrl: 'assets/images/face_serum_product.png',
      rating: 4.3,
      reviewsCount: 45,
      category: 'Skincare',
      description: 'Pure, organic rose water helps to soothe and refresh the skin after cleansing, providing a delicate floral fragrance and a soft glow.',
    ),
    Product(
      id: '8',
      name: 'Golden Hour Highlighter',
      brand: 'LOURÈ',
      price: 38.00,
      imageUrl: 'assets/images/lipstick_product.png',
      rating: 4.9,
      reviewsCount: 112,
      category: 'Makeup',
      description: 'A finely milled, shimmering highlighter that catches the light beautifully, giving you a radiant glow reminiscent of the golden hour.',
    ),
    Product(
      id: '9',
      name: 'Lavender Mist Parfum',
      brand: 'ESPRIT',
      price: 95.00,
      imageUrl: 'assets/images/perfume_product.png',
      rating: 4.7,
      reviewsCount: 78,
      category: 'Perfume',
      description: 'A relaxing and sophisticated lavender-based perfume with notes of vanilla and white musk, perfect for evening wear.',
    ),
    Product(
      id: '10',
      name: 'Keratin Repair Mask',
      brand: 'GLOSS HAIR',
      price: 42.00,
      imageUrl: 'assets/images/face_serum_product.png',
      rating: 4.6,
      reviewsCount: 94,
      category: 'Haircare',
      description: 'An intensive hair treatment designed to strengthen and repair damaged hair using plant-based keratin and argan oil.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = _allProducts.where((p) {
      final matchesCategory = _selectedCategory == 'All' || p.category == _selectedCategory;
      final matchesSearch = p.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          p.brand.toLowerCase().contains(_searchController.text.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    // Sorting logic (placeholder)
    if (_sortBy == 'Price: Low to High') {
      filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (_sortBy == 'Price: High to Low') {
      filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    }

    return Scaffold(
      backgroundColor: CosmoTheme.creamWhite,
      appBar: AppBar(
        title: Text(
          'SHOP',
          style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        actions: [
          IconButton(
            icon: const Badge(
              label: Text('2'),
              child: Icon(Icons.shopping_bag_outlined),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (val) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            hintStyle: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
                            prefixIcon: const Icon(Icons.search, size: 20),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: CosmoTheme.deepCharcoal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.filter_list, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: _categories.map((cat) {
                    final isSelected = _selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: isSelected,
                        onSelected: (val) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        },
                        selectedColor: CosmoTheme.roseGold,
                        labelStyle: GoogleFonts.lato(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filteredProducts.length} Products Found',
                  style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                DropdownButton<String>(
                  value: _sortBy,
                  icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                  underline: const SizedBox(),
                  style: GoogleFonts.lato(color: Colors.black, fontSize: 12),
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortBy = newValue!;
                    });
                  },
                  items: _sortOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: product,
                          heroTag: 'shop_product_${product.id}',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Hero(
                                tag: 'shop_product_${product.id}',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(product.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.favorite_border,
                                      size: 16, color: CosmoTheme.roseGold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.brand,
                                style: GoogleFonts.lato(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: CosmoTheme.roseGold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 12),
                                  const SizedBox(width: 2),
                                  Text(
                                    product.rating.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: CosmoTheme.deepCharcoal,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

