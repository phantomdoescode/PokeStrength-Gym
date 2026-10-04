import 'package:flutter/material.dart';
import '../controllers/rewards_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/reward_card.dart';

class RewardsScreen extends StatelessWidget {
  final RewardsController rewardsController;

  const RewardsScreen({super.key, required this.rewardsController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Rewards Vault')),

      body: AnimatedBuilder(
        animation: rewardsController,
        builder: (context, _) {
          final rewards = rewardsController.rewards;

          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              children: [
                // ==================================
                // HEADER
                // ==================================
                Text(
                  'Rewards Vault',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Unlock high tier pocket companion awards from raw effort!',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),

                const SizedBox(height: 28),

                // ==================================
                // POKÉMON COMPANION SQUAD
                // ==================================
                Text(
                  'Pokémon Companion Squad',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 16),

                if (rewards.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: AppTheme.cardDecoration(context, radius: 10),
                    child: Text(
                      'No Pokémon rewards yet.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  )
                else
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Keep two cards per row while
                      // allowing the cards to determine
                      // their own height.
                      final cardWidth = (constraints.maxWidth - 16) / 2;

                      return Wrap(
                        spacing: 16,
                        runSpacing: 18,
                        children: [
                          for (final reward in rewards)
                            SizedBox(
                              width: cardWidth,
                              child: RewardCard(
                                pokemonName: reward.pokemonName,
                                type: reward.pokemonType,
                                rarity: reward.rarity,
                                xpEarned: reward.xpEarned,
                              ),
                            ),
                        ],
                      );
                    },
                  ),

                const SizedBox(height: 32),

                // ==================================
                // EARNED GYM BADGES
                // ==================================
                Text(
                  'Earned Gym Badges',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 16),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: _BadgeItem(
                            title: '7-Day Streak',
                            icon: Icons.calendar_month_outlined,
                            color: AppTheme.secondary,
                          ),
                        ),
                        Expanded(
                          child: _BadgeItem(
                            title: 'First Workout',
                            icon: Icons.workspace_premium_outlined,
                            color: AppTheme.success,
                          ),
                        ),
                        Expanded(
                          child: _BadgeItem(
                            title: '1000 XP Club',
                            icon: Icons.emoji_events_outlined,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _BadgeItem({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: isDark ? 0.18 : 0.12),
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, color: color, size: 31),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
