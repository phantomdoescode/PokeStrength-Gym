import 'package:flutter/material.dart';
import '../data/pokemon_reward.dart';
import '../theme/app_theme.dart';

class RewardCard extends StatelessWidget {
  final String pokemonName;
  final String type;
  final String rarity;
  final int xpEarned;
  final Color? accentColor;
  final String? image;

  const RewardCard({
    super.key,
    required this.pokemonName,
    required this.type,
    required this.rarity,
    required this.xpEarned,
    this.accentColor,
    this.image,
  });

  Color get _typeColor {
    return accentColor ?? AppTheme.pokemonTypeColor(type);
  }

  Color _rarityColor() {
    switch (rarity.toLowerCase()) {
      case 'common':
        return const Color(0xFF757575);
      case 'uncommon':
        return const Color(0xFF42A5F5);
      case 'rare':
        return const Color(0xFFFFA726);
      case 'legendary':
        return const Color(0xFFAB47BC);
      default:
        return AppTheme.textSecondary;
    }
  }

  IconData _iconForType(String type) {
    final mainType = type.split('/').first.trim().toLowerCase();
    switch (mainType) {
      case 'normal':
        return Icons.circle_outlined;
      case 'fire':
        return Icons.local_fire_department;
      case 'water':
        return Icons.water_drop;
      case 'grass':
        return Icons.grass;
      case 'electric':
        return Icons.flash_on;
      case 'ground':
        return Icons.landscape;
      case 'bug':
        return Icons.bug_report;
      case 'psychic':
        return Icons.auto_awesome;
      case 'poison':
        return Icons.science;
      case 'fighting':
        return Icons.sports_martial_arts;
      case 'flying':
        return Icons.air;
      case 'rock':
        return Icons.terrain;
      case 'ice':
        return Icons.ac_unit;
      case 'ghost':
        return Icons.nights_stay;
      case 'dragon':
        return Icons.whatshot;
      default:
        return Icons.stars;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryText = isDark
        ? AppTheme.darkTextPrimary
        : AppTheme.textPrimary;
    final secondaryText = isDark
        ? AppTheme.darkTextSecondary
        : AppTheme.textSecondary;
    final borderColor = isDark
        ? AppTheme.darkCardBorder
        : AppTheme.lightCardBorder;
    final rarityColor = _rarityColor();

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pokémon type color bar.
          Container(height: 7, width: double.infinity, color: _typeColor),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Pokémon type icon or image.
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _typeColor.withValues(alpha: isDark ? 0.20 : 0.15),
                  ),
                  child: image != null
                      ? ClipOval(
                          child: Image.asset(
                            image!,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                _iconForType(type),
                                color: _typeColor,
                                size: 30,
                              );
                            },
                          ),
                        )
                      : Icon(_iconForType(type), color: _typeColor, size: 30),
                ),

                const SizedBox(height: 8),

                // Pokémon name.
                Text(
                  pokemonName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: primaryText,
                  ),
                ),

                const SizedBox(height: 4),

                // Pokémon type.
                Text(
                  type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: secondaryText),
                ),

                const SizedBox(height: 6),

                // Updated evolution-based rarity.
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: rarityColor.withValues(alpha: isDark ? 0.20 : 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    rarity,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: rarityColor,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // XP earned.
                Text(
                  '$xpEarned XP earned',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.success,
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
