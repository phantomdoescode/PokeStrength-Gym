import 'package:flutter/material.dart';
import '../controllers/rewards_controller.dart';
import '../widgets/reward_card.dart';

class RewardsScreen extends StatelessWidget {
  final RewardsController rewardsController;

  const RewardsScreen({super.key, required this.rewardsController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rewardsController,
      builder: (context, _) {
        final rewards = rewardsController.rewards;

        return SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            children: [
              Text(
                'Rewards Vault',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 4),

              Text(
                'Unlock high tier pocket companion awards from raw effort!',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 22),

              const Text(
                'Pokémon Companion Squad',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: rewards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final reward = rewards[index];

                  return RewardCard(
                    pokemonName: reward.pokemonName,
                    type: reward.pokemonType,
                    rarity: reward.rarity,
                    xpEarned: reward.xpEarned,
                    accentColor: _rewardColor(index),
                  );
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Earned Gym Badges',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _BadgeItem(
                    icon: Icons.calendar_today,
                    label: '7-Day Streak',
                    color: Color(0xFFFFD43D),
                  ),
                  _BadgeItem(
                    icon: Icons.workspace_premium_outlined,
                    label: 'First Workout',
                    color: Color(0xFF43A047),
                  ),
                  _BadgeItem(
                    icon: Icons.emoji_events_outlined,
                    label: '1000 XP Club',
                    color: Color(0xFFEF5350),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color _rewardColor(int index) {
    const colors = [
      Color(0xFFFFD43D),
      Color(0xFF27AEEF),
      Color(0xFFFF9E21),
      Color(0xFF90A4AE),
    ];

    return colors[index % colors.length];
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _BadgeItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.12),
              border: Border.all(color: color, width: 1.5),
            ),
            child: Icon(icon, color: color, size: 26),
          ),

          const SizedBox(height: 7),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
