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
    // Only the XP within the current level is used for the
    // progress indicator.
    final currentLevelXp = currentXp % nextLevelXp;

    final progress = (currentLevelXp / nextLevelXp).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_border,
                  size: 19,
                  color: Color(0xFFFFC928),
                ),
                const SizedBox(width: 6),
                Text(
                  'Trainer Level Progress',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Text(
              '$currentLevelXp / $nextLevelXp XP',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Level $level',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),

        const SizedBox(height: 6),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            color: const Color(0xFFFFD54F),
            backgroundColor: const Color(0xFFE8E8E8),
          ),
        ),
      ],
    );
  }
}
