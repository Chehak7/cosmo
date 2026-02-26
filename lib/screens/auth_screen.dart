import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme.dart';
import '../providers/auth_provider.dart';
import '../main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  bool _isLogin = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _submit() {
    final form = _isLogin ? _loginFormKey.currentState : _signupFormKey.currentState;
    if (form!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
      if (_isLogin) {
        authProvider.login(_emailController.text, _passwordController.text);
      } else {
        authProvider.signup(_nameController.text, _emailController.text, _passwordController.text);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationWrapper()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmoTheme.creamWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              // Logo & Tagline
              Column(
                children: [
                  Text(
                    'COSMO',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                      color: CosmoTheme.deepCharcoal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'PURE ELEGANCE. RADIANT BEAUTY.',
                    style: GoogleFonts.lato(
                      fontSize: 10,
                      letterSpacing: 3,
                      color: CosmoTheme.roseGold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              // Toggle tab
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _toggleButton('LOGIN', _isLogin, () {
                        if (!_isLogin) _toggleAuthMode();
                      }),
                    ),
                    Expanded(
                      child: _toggleButton('SIGN UP', !_isLogin, () {
                        if (_isLogin) _toggleAuthMode();
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Form
              FadeTransition(
                opacity: _fadeAnimation,
                child: _isLogin ? _buildLoginForm() : _buildSignupForm(),
              ),

              const SizedBox(height: 30),
              
              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30),

              // Google Sign In
              _googleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggleButton(String title, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? CosmoTheme.deepCharcoal : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          _buildTextField('Email Address', Icons.email_outlined, _emailController, (value) {
            if (value == null || !value.contains('@')) return 'Invalid email';
            return null;
          }),
          const SizedBox(height: 20),
          _buildTextField('Password', Icons.lock_outline, _passwordController, (value) {
            if (value == null || value.length < 6) return 'Password too short';
            return null;
          }, isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.lato(color: Colors.grey, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _primaryButton('SIGN IN', _submit),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Form(
      key: _signupFormKey,
      child: Column(
        children: [
          _buildTextField('Full Name', Icons.person_outline, _nameController, (value) {
            if (value == null || value.isEmpty) return 'Please enter your name';
            return null;
          }),
          const SizedBox(height: 20),
          _buildTextField('Email Address', Icons.email_outlined, _emailController, (value) {
            if (value == null || !value.contains('@')) return 'Invalid email';
            return null;
          }),
          const SizedBox(height: 20),
          _buildTextField('Password', Icons.lock_outline, _passwordController, (value) {
            if (value == null || value.length < 6) return 'Password must be 6+ chars';
            return null;
          }, isPassword: true),
          const SizedBox(height: 20),
          _buildTextField('Confirm Password', Icons.lock_outline, _confirmPasswordController, (value) {
            if (value != _passwordController.text) return 'Passwords do not match';
            return null;
          }, isPassword: true),
          const SizedBox(height: 30),
          _primaryButton('CREATE ACCOUNT', _submit),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, String? Function(String?)? validator, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.lato(color: Colors.grey),
        prefixIcon: Icon(icon, color: CosmoTheme.roseGold),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget _primaryButton(String title, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: CosmoTheme.deepCharcoal,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          title,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _googleSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.network(
          'https://www.gstatic.com/images/branding/product/2x/googleg_48dp.png',
          height: 18,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.login, size: 18, color: Colors.blue),
        ),
        label: Text(
          'CONTINUE WITH GOOGLE',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: CosmoTheme.deepCharcoal,
            fontSize: 13,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

