import 'package:flutter/material.dart';

class XpProgressBar extends StatelessWidget {
  final int level;
  final int currentXp;
  final int nextLevelXp;

  const XpProgressBar({
    super.key,
    required this.level,
    required this.currentXp,
    required this.nextLevelXp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final progress = nextLevelXp <= 0
        ? 0.0
        : (currentXp / nextLevelXp).clamp(0.0, 1.0);

    final backgroundColor = isDark
        ? const Color(0xFF3A3A3A)
        : const Color(0xFFE6E6E6);

    final primaryText = isDark
        ? const Color(0xFFF5F5F5)
        : const Color(0xFF212121);

    final secondaryText = isDark
        ? const Color(0xFFBDBDBD)
        : const Color(0xFF616161);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trainer Level Progress',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: primaryText,
              ),
            ),

            Text(
              'Level $level',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: secondaryText,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,

            backgroundColor: backgroundColor,

            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD54F)),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          '$currentXp / $nextLevelXp XP',
          style: TextStyle(fontSize: 12, color: secondaryText),
        ),
      ],
    );
  }
}
