import 'package:flutter/material.dart';
import 'package:quote_vault/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,

    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  backgroundColor: Color(0xFF14112B),
  selectedItemColor: Colors.deepPurpleAccent,
  unselectedItemColor: Colors.white70,
  type: BottomNavigationBarType.fixed,
),


    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBackground,

      hintStyle: const TextStyle(color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
