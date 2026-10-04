import 'package:flutter/material.dart';

class AppTheme {
  // =========================
  // LIGHT MODE
  // =========================

  static const Color primary = Color(0xFFEF5350);
  static const Color secondary = Color(0xFFFFD54F);
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF616161);
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFFB8C00);
  static const Color error = Color(0xFFD32F2F);
  static const Color lightCardBorder = Color(0xFFE6E6E6);

  // =========================
  // DARK MODE
  // =========================

  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFF5F5F5);
  static const Color darkTextSecondary = Color(0xFFBDBDBD);
  static const Color darkSuccess = Color(0xFF66BB6A);
  static const Color darkWarning = Color(0xFFFFA726);
  static const Color darkCardBorder = Color(0xFF333333);

  // =========================
  // POKÉMON TYPE COLORS
  // =========================

  static const Color normalType = Color(0xFF9E9E9E);
  static const Color fireType = Color(0xFFEF5350);
  static const Color waterType = Color(0xFF42A5F5);
  static const Color grassType = Color(0xFF66BB6A);
  static const Color electricType = Color(0xFFFFD54F);
  static const Color groundType = Color(0xFF8D6E63);
  static const Color bugType = Color(0xFF9CCC65);
  static const Color psychicType = Color(0xFFEC407A);
  static const Color poisonType = Color(0xFFAB47BC);
  static const Color fightingType = Color(0xFF8D4A3E);
  static const Color flyingType = Color(0xFF81D4FA);
  static const Color rockType = Color(0xFFBCAAA4);
  static const Color iceType = Color(0xFF4FC3F7);
  static const Color ghostType = Color(0xFF5C6BC0);
  static const Color dragonType = Color(0xFF7E57C2);

  static Color pokemonTypeColor(String type) {
    // Uses only the first/main type when a Pokémon has
    // two types, e.g. Fire/Flying -> Fire.
    final mainType = type.split('/').first.trim().toLowerCase();

    switch (mainType) {
      case 'normal':
        return normalType;
      case 'fire':
        return fireType;
      case 'water':
        return waterType;
      case 'grass':
        return grassType;
      case 'electric':
        return electricType;
      case 'ground':
        return groundType;
      case 'bug':
        return bugType;
      case 'psychic':
        return psychicType;
      case 'poison':
        return poisonType;
      case 'fighting':
        return fightingType;
      case 'flying':
        return flyingType;
      case 'rock':
        return rockType;
      case 'ice':
        return iceType;
      case 'ghost':
        return ghostType;
      case 'dragon':
        return dragonType;
      default:
        return normalType;
    }
  }

  // Shared card decoration so cards look consistent in
  // both Light and Dark Mode.
  static BoxDecoration cardDecoration(
    BuildContext context, {
    double radius = 10,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: isDark ? darkCardBorder : lightCardBorder),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDark ? 0.20 : 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // =========================
  // LIGHT THEME
  // =========================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: textPrimary,
      tertiary: Color(0xFF29B6F6),
      onTertiary: textPrimary,
      surface: surface,
      onSurface: textPrimary,
      error: error,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: surface,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      color: surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: textPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: textPrimary),
      bodySmall: TextStyle(fontSize: 12, color: textSecondary),
    ),
  );

  // =========================
  // DARK THEME
  // =========================

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: textPrimary,
      tertiary: Color(0xFF29B6F6),
      onTertiary: textPrimary,
      surface: darkSurface,
      onSurface: darkTextPrimary,
      error: error,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: darkTextPrimary,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      color: darkSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    // DARK MODE NAVIGATION BAR
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkSurface,
      selectedItemColor: primary,
      unselectedItemColor: darkTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: darkTextPrimary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: darkTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: darkTextPrimary),
      bodySmall: TextStyle(fontSize: 12, color: darkTextSecondary),
    ),
  );
}

class AppSpacing {
  static const double base = 8;
  static const double screen = 24;
  static const double md = 16;
  static const SizedBox space8 = SizedBox(height: 8);
  static const SizedBox space16 = SizedBox(height: 16);
  static const SizedBox space24 = SizedBox(height: 24);
}
