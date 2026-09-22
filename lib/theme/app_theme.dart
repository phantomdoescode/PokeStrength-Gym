import 'package:flutter/material.dart';

class AppColors {
  // Light Mode Colors
  // Main project color used for buttons and navigation.
  static const primary = Color(0xFFEF5350);
  static const onPrimary = Color(0xFFFFFFFF);

  // Accent color used for XP, rewards, and progress.
  static const secondary = Color(0xFF42A5F5);
  static const onSecondary = Color(0xFF212121);
  static const lightSurface = Color(0xFFFFFFFF);

  // Main background
  static const lightBackground = Color(0xFFF8F9FA);
  static const lightTextPrimary = Color(0xFF212121);
  static const lightTextSecondary = Color(0xFF616161);
  static const lightSuccess = Color(0xFF43A047);
  static const lightWarning = Color(0xFFFB8C00);

  // Dark Mode Colors
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkBackground = Color(0xFF121212);
  static const darkTextPrimary = Color(0xFFF5F5F5);
  static const darkTextSecondary = Color(0xFFBDBDBD);
  static const darkSuccess = Color(0xFF66BB6A);
  static const darkWarning = Color(0xFFFFA726);

  // Error color both used by light and dark mode.
  static const error = Color(0xFFD32F2F);
}

class AppSpacing {
  // The project uses an 8px spacing system.
  static const double space8 = 8;

  // Standard spacing between sections.
  static const double space16 = 16;

  // Standard screen edge padding.
  static const double space24 = 24;
}

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,

    // ColorScheme provides the colors used by Material widgets
    // throughout the application.
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
      error: AppColors.error,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.lightBackground,
    // These text styles follow the project's design system:
    // 24sp headings, 16sp body text, and 12sp captions.
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
      labelSmall: TextStyle(fontSize: 12),
    ),

    // Gives cards a consistent appearance across the application.
    cardTheme: const CardThemeData(elevation: 1, margin: EdgeInsets.zero),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.error,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
      labelSmall: TextStyle(fontSize: 12),
    ),

    cardTheme: const CardThemeData(elevation: 1, margin: EdgeInsets.zero),
  );
}
