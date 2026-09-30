import 'package:flutter/material.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/rewards_controller.dart';
import '../controllers/trainer_controller.dart';
import '../controllers/workout_controller.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/primary_button.dart';
import '../widgets/reward_card.dart';
import '../widgets/trainer_avatar.dart';
import '../widgets/xp_progress_bar.dart';
import 'exercise_library.dart';
import 'rewards_screen.dart';
import 'trainer_profile.dart';
import 'workout_tracker.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  final NavigationController _navigationController = NavigationController();
  final TrainerController _trainerController = TrainerController();
  final WorkoutController _workoutController = WorkoutController();
  final RewardsController _rewardsController = RewardsController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _loadApplicationData();
  }

  Future<void> _loadApplicationData() async {
    // Load all locally stored application data before
    // displaying the main dashboard.
    await Future.wait([
      _trainerController.initialize(),
      _workoutController.initialize(),
      _rewardsController.initialize(),
    ]);

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _navigationController.dispose();
    _trainerController.dispose();
    _workoutController.dispose();
    _rewardsController.dispose();

    super.dispose();
  }

  Widget _buildHome() {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _trainerController,
        _workoutController,
        _rewardsController,
      ]),
      builder: (context, _) {
        final member = _trainerController.member;

        if (member == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // Only show the first two collected Pokémon on
        // the Home Dashboard. The complete collection is
        // shown in the Rewards Vault.
        final nearbyRewards = _rewardsController.rewards.take(2).toList();

        return SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            children: [
              // Greeting section.
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${member.name.split(' ').first}!',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Ready for your training session today?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      _navigationController.setIndex(4);
                    },
                    child: const TrainerAvatar(size: 44),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Trainer XP progress card.
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE6E6E6)),
                ),
                child: XpProgressBar(
                  level: member.currentLevel,
                  currentXp: member.totalXp,
                  nextLevelXp: 5000,
                ),
              ),

              const SizedBox(height: 20),

              // Today's Active Mission.
              const Text(
                "Today's Active Mission",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Upper Body Blast card from the mockup.
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE6E6E6)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 138,
                      width: double.infinity,
                      child: Image.asset(
                        'docs/assets/images/upper_body_blast.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Icon(Icons.fitness_center, size: 48),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Upper Body Blast',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            '6 exercises • 35 min • 280 cal',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF666666),
                            ),
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: FilledButton.icon(
                              onPressed: () {
                                _navigationController.setIndex(1);
                              },
                              icon: const Icon(
                                Icons.play_circle_outline,
                                size: 17,
                              ),
                              label: const Text('Start Workout'),
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFEF5350),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Rewards Nearby header.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rewards Nearby',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {
                      _navigationController.setIndex(3);
                    },
                    child: const Text(
                      'View All Collection',
                      style: TextStyle(
                        color: Color(0xFFEF5350),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Nearby rewards.
              if (nearbyRewards.isEmpty)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE6E6E6)),
                  ),
                  child: const Text(
                    'No Pokémon rewards yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Color(0xFF666666)),
                  ),
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (
                      int index = 0;
                      index < nearbyRewards.length;
                      index++
                    ) ...[
                      Expanded(
                        child: RewardCard(
                          pokemonName: nearbyRewards[index].pokemonName,
                          type: nearbyRewards[index].pokemonType,
                          rarity: nearbyRewards[index].rarity,
                          xpEarned: nearbyRewards[index].xpEarned,
                          accentColor: index.isEven
                              ? const Color(0xFFFFD43D)
                              : const Color(0xFF27AEEF),
                          compact: true,
                        ),
                      ),

                      if (index != nearbyRewards.length - 1)
                        const SizedBox(width: 10),
                    ],
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrentScreen() {
    switch (_navigationController.currentIndex) {
      case 0:
        return _buildHome();

      case 1:
        return WorkoutTrackerScreen(
          workoutController: _workoutController,
          trainerController: _trainerController,
          rewardsController: _rewardsController,
          onFinished: () {
            _navigationController.setIndex(3);
          },
        );

      case 2:
        return const ExerciseLibraryScreen();

      case 3:
        return RewardsScreen(rewardsController: _rewardsController);

      case 4:
        return TrainerProfileScreen(
          trainerController: _trainerController,
          workoutController: _workoutController,
          rewardsController: _rewardsController,
        );

      default:
        return _buildHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return AnimatedBuilder(
      animation: _navigationController,
      builder: (context, _) {
        return Scaffold(
          body: _buildCurrentScreen(),

          bottomNavigationBar: AppBottomNav(
            currentIndex: _navigationController.currentIndex,
            onDestinationSelected: _navigationController.setIndex,
          ),
        );
      },
    );
  }
}
