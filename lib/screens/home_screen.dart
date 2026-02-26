import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import '../core/theme.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<String> banners = [
      'assets/images/summer_glow_banner.png',
      'assets/images/new_arrivals_banner.png',
      'assets/images/best_sellers_banner.png',
    ];

    final List<Category> categories = [
      Category(name: 'Skincare', icon: '✨'),
      Category(name: 'Makeup', icon: '💄'),
      Category(name: 'Perfume', icon: '🌸'),
      Category(name: 'Haircare', icon: '💇🏻‍♀️'),
      Category(name: 'Lip Care', icon: '💋'),
    ];

    final List<Product> featuredProducts = [
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
        name: 'Golden Hour Glow',
        brand: 'COSMO LUXE',
        price: 65.00,
        imageUrl: 'assets/images/lipstick_product.png', 
        rating: 4.6,
        reviewsCount: 56,
        category: 'Makeup',
        description: 'Achieve that perfect sun-kissed radiance with our Golden Hour palette. This versatile collection features warm bronzers, highlighters, and shimmering shadows to enhance your natural beauty.',
      ),
    ];

    return Scaffold(
      backgroundColor: CosmoTheme.creamWhite,
      appBar: AppBar(
        title: Text(
          'COSMO',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        actions: [
          IconButton(
            icon: Badge(
              label: const Text('2'),
              child: const Icon(Icons.shopping_bag_outlined),
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
      ),
      body: CustomScrollView(
        slivers: [
          // Banner Carousel
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(banners[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        index == 0
                            ? 'SUMMER GLOW SALE'
                            : index == 1
                                ? 'NEW ARRIVALS'
                                : 'BEST SELLERS',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Categories Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  categories[index].icon,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                categories[index].name,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Featured Products Section
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Featured Products',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = featuredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                            heroTag: 'home_product_${product.id}',
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
                                  tag: 'home_product_${product.id}',
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
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_outline, size: 20),
                                    onPressed: () {},
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                childCount: featuredProducts.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String icon;

  Category({required this.name, required this.icon});
}
