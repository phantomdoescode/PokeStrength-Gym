import 'package:flutter/material.dart';
import '../controllers/rewards_controller.dart';
import '../controllers/trainer_controller.dart';
import '../controllers/workout_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import 'edit_profile.dart';

class TrainerProfileScreen extends StatelessWidget {
  final TrainerController trainerController;
  final WorkoutController workoutController;
  final RewardsController rewardsController;

  const TrainerProfileScreen({
    super.key,
    required this.trainerController,
    required this.workoutController,
    required this.rewardsController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        trainerController,
        workoutController,
        rewardsController,
      ]),
      builder: (context, _) {
        final member = trainerController.member;

        if (member == null) {
          return const SafeArea(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final totalWorkouts = workoutController.totalCompletedWorkouts;
        final pokemonCount = rewardsController.rewards.length;

        return SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            children: [
              // Logo shown at the top of the mockup.
              Center(
                child: SizedBox(
                  width: 145,
                  height: 75,
                  child: AppLogo(width: 150),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Trainer Card Hub',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 24),

              Center(
                child: Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFEF5350),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'docs/assets/images/trainer_avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: AppTheme.cardDecoration(context, radius: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _InfoRow(
                      label: 'Trainer Level',
                      value: '${member.currentLevel}',
                    ),

                    const SizedBox(height: 8),

                    _InfoRow(label: 'XP Gained', value: '${member.totalXp} XP'),

                    const SizedBox(height: 8),

                    _InfoRow(
                      label: 'Workout Streak',
                      value: '${member.workoutStreak} days',
                      valueColor: const Color(0xFF43A047),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level ${member.currentLevel}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          '${member.totalXp} / ${TrainerController.xpPerLevel} XP',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 9),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: (member.totalXp / TrainerController.xpPerLevel)
                            .clamp(0.0, 1.0),
                        minHeight: 8,
                        color: const Color(0xFFFFD54F),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Trainer statistics row.
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      value: '$totalWorkouts',
                      label: 'Workouts',
                      color: const Color(0xFFEF5350),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      value: '${member.totalXp}',
                      label: 'Total XP',
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      value: '$pokemonCount',
                      label: 'Pokémon',
                      color: const Color(0xFF27AEEF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => EditProfileScreen(
                          trainerController: trainerController,
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFEF5350),
                    side: const BorderSide(color: Color(0xFFEF5350)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    'Edit Trainer Card',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: valueColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: AppTheme.cardDecoration(context, radius: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 8),
          ),
        ],
      ),
    );
  }
}
