import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class ThemeState {
  final ThemeData themeData;
  ThemeState({required this.themeData});
}

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(themeData: _lightTheme));
  static double borderRadius = 6.0;
  static final ThemeData _lightTheme = _buildLightTheme();
  static ThemeData _buildLightTheme() {
    final MaterialColor primaryColor = MaterialColor(
      0xFFEFE6C8,
      {
        50: Color(0xFFFBFAF3),
        100: Color(0xFFF5F0DD),
        200: Color(0xFFEEE4C3),
        300: Color(0xFFE7D8A9),
        400: Color(0xFFE2CF95),
        500: Color(0xFFEFE6C8),
        600: Color(0xFFD8CFAF),
        700: Color(0xFFC1B896),
        800: Color(0xFFAAA17D),
        900: Color(0xFF8C8461),
      },
    );

    final baseTheme = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        contentPadding:
         EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.aDLaMDisplay(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
      ),
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        backgroundColor: Colors.white,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.openSansTextTheme(baseTheme.textTheme),
    );
  }
  void setLightTheme() {
    state = ThemeState(themeData: _lightTheme);
  }
}

final appThemeProvider =
StateNotifierProvider<ThemeNotifier, ThemeState>(
      (ref) => ThemeNotifier(),
);