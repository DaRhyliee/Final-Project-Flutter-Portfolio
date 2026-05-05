import 'package:flutter/material.dart';

class AppTheme {
  // ── Color Palette ──────────────────────────────────────────────
  static const Color primary = Color(0xFF5BB8F5);
  static const Color primaryLight = Color(0xFFADD8F7);
  static const Color primaryPastel = Color(0xFFD6EEF9);
  static const Color accent = Color(0xFF1E88E5);
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textMedium = Color(0xFF5A5A72);
  static const Color textLight = Color(0xFF9B9BAA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF0F8FF);

  // ── Text Styles ────────────────────────────────────────────────
  static const TextStyle nameStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: primary,
    letterSpacing: 0.3,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: textDark,
    letterSpacing: -0.2,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: textMedium,
    height: 1.6,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: textLight,
    letterSpacing: 0.5,
  );

  static const TextStyle sectionHeaderStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: primary,
    letterSpacing: 0.2,
  );

  // ── Theme Data ─────────────────────────────────────────────────
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: textDark,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
          iconTheme: IconThemeData(color: textDark),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
      );
}
