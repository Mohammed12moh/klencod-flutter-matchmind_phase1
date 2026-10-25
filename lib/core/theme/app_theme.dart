import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// الثيم الموحد لتطبيق MatchMind — الوضع الداكن هو الافتراضي.
/// كل الشاشات يجب أن تستخدم هذا الثيم بدل تكرار الألوان يدويًا.
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.navyBackground,
      primaryColor: AppColors.primaryGreen,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryGreen,
        secondary: AppColors.primaryGreen,
        surface: AppColors.navySurface,
        error: AppColors.liveRed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.navyBackground,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.navyCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.navyBorder, width: 1),
        ),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navySurface,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.navyCard,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.navyBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.navyBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 1.4),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.navyBorder,
        thickness: 1,
      ),
      useMaterial3: true,
    );
  }
}
