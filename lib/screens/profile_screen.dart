import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';
import 'splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    // Provide default values if not logged in (though normally this screen is protected)
    final userName = authProvider.userName ?? 'Guest User';
    final userEmail = authProvider.userEmail ?? 'guest@example.com';

    return Scaffold(
      backgroundColor: CosmoTheme.creamWhite,
      appBar: AppBar(
        title: Text(
          'MY PROFILE',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${cartProvider.itemCount}'),
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
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // User Header
              Center(
                child: Column(
                  children: [
                    Text(
                      userName,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userEmail,
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: CosmoTheme.deepCharcoal,
                        side: const BorderSide(color: CosmoTheme.deepCharcoal),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      ),
                      child: Text(
                        'EDIT PROFILE',
                        style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Menu Sections
              _buildMenuSection('Account Settings', [
                _buildMenuItem(Icons.shopping_bag_outlined, 'My Orders'),
                _buildMenuItem(Icons.location_on_outlined, 'My Addresses'),
                _buildMenuItem(Icons.payment_outlined, 'Payment Methods'),
              ]),
              const SizedBox(height: 24),
              _buildMenuSection('Preferences', [
                _buildMenuItem(Icons.notifications_none_outlined, 'Notifications'),
                _buildMenuItem(Icons.help_outline, 'Help & Support'),
                _buildMenuItem(Icons.info_outline, 'About COSMO'),
              ]),
              const SizedBox(height: 32),
              
              // Logout
              ListTile(
                onTap: () {
                  _showLogoutDialog(context, authProvider);
                },
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: Text(
                  'Logout',
                  style: GoogleFonts.lato(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logout', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
        content: const Text('Are you sure you want to logout from COSMO?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('CANCEL', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              authProvider.logout();
              Navigator.pop(ctx);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                (route) => false,
              );
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, color: CosmoTheme.deepCharcoal, size: 22),
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CosmoTheme.deepCharcoal,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}

