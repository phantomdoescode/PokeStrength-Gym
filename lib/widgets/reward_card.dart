import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final String pokemonName;
  final String type;
  final String rarity;
  final int xpEarned;
  final Color accentColor;
  final String? image;
  final bool compact;

  const RewardCard({
    super.key,
    required this.pokemonName,
    required this.type,
    required this.rarity,
    required this.xpEarned,
    required this.accentColor,
    this.image,
    this.compact = false,
  });

  IconData _iconForType(String type) {
    final firstType = type.toLowerCase().split('/').first.trim();

    switch (firstType) {
      case 'electric':
        return Icons.flash_on_outlined;
      case 'water':
        return Icons.water_drop_outlined;
      case 'fire':
        return Icons.local_fire_department_outlined;
      case 'grass':
        return Icons.grass_outlined;
      case 'poison':
        return Icons.science_outlined;
      case 'bug':
        return Icons.bug_report_outlined;
      case 'flying':
        return Icons.air_outlined;
      case 'ground':
        return Icons.landscape_outlined;
      case 'fighting':
        return Icons.sports_martial_arts_outlined;
      case 'psychic':
        return Icons.auto_awesome_outlined;
      case 'rock':
        return Icons.terrain_outlined;
      case 'ice':
        return Icons.ac_unit_outlined;
      case 'dragon':
        return Icons.whatshot_outlined;
      default:
        return Icons.stars;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 10 : 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(compact ? 10 : 12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.18)),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: const Offset(0, 2),
            color: Colors.black.withValues(alpha: 0.04),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mockup-style colored line on top of every card.
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),

          SizedBox(height: compact ? 8 : 9),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: compact ? 16 : 19,
                backgroundColor: accentColor.withValues(alpha: 0.14),
                child: image != null
                    ? ClipOval(
                        child: Image.asset(
                          image!,
                          width: compact ? 32 : 38,
                          height: compact ? 32 : 38,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              _iconForType(type),
                              color: accentColor,
                              size: compact ? 16 : 20,
                            );
                          },
                        ),
                      )
                    : Icon(
                        _iconForType(type),
                        color: accentColor,
                        size: compact ? 16 : 20,
                      ),
              ),

              SizedBox(width: compact ? 8 : 9),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemonName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: compact ? 11 : 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      '$type • $rarity',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: compact ? 8 : 9,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      '$xpEarned XP',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: compact ? 8 : 9,
                        color: const Color(0xFFEF5350),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // The larger Rewards Vault card gets the open space
          // shown in the Figma mockup.
          if (!compact) const Spacer(),
        ],
      ),
    );
  }
}
