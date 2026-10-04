import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width;

  const AppLogo({super.key, this.width = 180});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final logoPath = isDark
        ? 'docs/assets/images/pokestrength_logo2.png'
        : 'docs/assets/images/pokestrength_logo.png';

    return Image.asset(
      logoPath,
      width: width,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Temporary fallback while the dark logo
        // has not been added yet.
        return Image.asset(
          'assets/images/pokestrength_logo.png',
          width: width,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.catching_pokemon,
              size: 80,
              color: Color(0xFFEF5350),
            );
          },
        );
      },
    );
  }
}
