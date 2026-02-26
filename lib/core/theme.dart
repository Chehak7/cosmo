import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CosmoTheme {
  // Color Palette
  static const Color roseGold = Color(0xFFB76E79);
  static const Color creamWhite = Color(0xFFFFF8F0);
  static const Color deepCharcoal = Color(0xFF2C2C2C);
  static const Color softGrey = Color(0xFFE5E5E5);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: roseGold,
        primary: roseGold,
        onPrimary: Colors.white,
        surface: creamWhite,
        onSurface: deepCharcoal,
        secondary: deepCharcoal,
        onSecondary: creamWhite,
      ),
      scaffoldBackgroundColor: creamWhite,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: deepCharcoal,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: deepCharcoal,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: deepCharcoal,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          color: deepCharcoal,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          color: deepCharcoal,
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: roseGold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: creamWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: deepCharcoal),
        titleTextStyle: TextStyle(
          color: deepCharcoal,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: roseGold,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: deepCharcoal,
          foregroundColor: creamWhite,
          textStyle: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
