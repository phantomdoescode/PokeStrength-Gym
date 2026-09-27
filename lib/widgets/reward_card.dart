import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final String pokemonName;
  final String type;
  final String rarity;
  final int xpEarned;
  final Color accentColor;

  const RewardCard({
    super.key,
    required this.pokemonName,
    required this.type,
    required this.rarity,
    required this.xpEarned,
    required this.accentColor,
  });

  IconData _getTypeIcon() {
    switch (type.toLowerCase()) {
      case 'water':
        return Icons.water_drop_outlined;
      case 'fire':
        return Icons.local_fire_department_outlined;
      case 'fighting':
        return Icons.sports_martial_arts_outlined;
      default:
        return Icons.flash_on_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 4, width: double.infinity, color: accentColor),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor.withValues(alpha: 0.16),
                  ),
                  child: Icon(_getTypeIcon(), color: accentColor, size: 20),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemonName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),

                      const SizedBox(height: 1),

                      Text(
                        '$type • $rarity',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Color(0xFF666666),
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        '$xpEarned XP',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 8,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
