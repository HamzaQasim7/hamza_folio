import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2D2F36),
        brightness: Brightness.light,
      ).copyWith(
        primary: const Color(0xFF2D2F36),
        secondary: const Color(0xFF6C63FF),
        tertiary: const Color(0xFF4ECDC4),
        background: const Color(0xFFFAFAFA),
        surface: Colors.white,
        surfaceVariant: const Color(0xFFF2F2F2),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: const Color(0xFF2D2F36),
        onSurface: const Color(0xFF2D2F36),
        error: const Color(0xFFDC3545),
      ),
      textTheme: _lightTextTheme(base.textTheme),
      cardTheme: _cardTheme(base.cardTheme, Colors.white),
      inputDecorationTheme:
          _inputDecorationTheme(Colors.white, const Color(0xFFE0E0E0)),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );
  }

  static ThemeData darkTheme() {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF),
        brightness: Brightness.dark,
      ).copyWith(
        primary: const Color(0xFF6C63FF),
        secondary: const Color(0xFF4ECDC4),
        tertiary: const Color(0xFF6C63FF),
        background: const Color(0xFF121212),
        surface: const Color(0xFF1E1E1E),
        surfaceVariant: const Color(0xFF2C2C2C),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: Colors.white,
        onSurface: Colors.white,
        error: const Color(0xFFDC3545),
      ),
      textTheme: _darkTextTheme(base.textTheme),
      cardTheme: _cardTheme(base.cardTheme, const Color(0xFF1E1E1E)),
      inputDecorationTheme: _inputDecorationTheme(
          const Color(0xFF1E1E1E), const Color(0xFF3E3E3E)),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );
  }

  static TextTheme _lightTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: const Color(0xFF2D2F36),
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: const Color(0xFF2D2F36),
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2D2F36),
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2D2F36),
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2D2F36),
      ),
      titleLarge: GoogleFonts.spaceMono(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF2D2F36),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: const Color(0xFF4A4A4A),
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: const Color(0xFF4A4A4A),
      ),
    );
  }

  static TextTheme _darkTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.spaceMono(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: const Color(0xFFE0E0E0),
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: const Color(0xFFE0E0E0),
      ),
    );
  }

  static CardTheme _cardTheme(CardTheme base, Color color) {
    return base.copyWith(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(
      Color fillColor, Color borderColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// Extension method for custom colors
extension CustomColors on ColorScheme {
  Color get cardBackground => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF1E1E1E);

  Color get subtleText => brightness == Brightness.light
      ? const Color(0xFF6B7280)
      : const Color(0xFFBBBBBB);

  Color get divider => brightness == Brightness.light
      ? const Color(0xFFE5E7EB)
      : const Color(0xFF2C2C2C);

  Color get subtle => brightness == Brightness.light
      ? const Color(0xFFF3F4F6)
      : const Color(0xFF2C2C2C);
}
