import 'dart:async';
import 'package:flutter/material.dart';
import '../controllers/rewards_controller.dart';
import '../controllers/trainer_controller.dart';
import '../controllers/workout_controller.dart';
import '../data/pokemon_reward.dart';
import '../widgets/primary_button.dart';

class WorkoutTrackerScreen extends StatefulWidget {
  final WorkoutController workoutController;
  final TrainerController trainerController;
  final RewardsController rewardsController;
  final VoidCallback onFinished;

  const WorkoutTrackerScreen({
    super.key,
    required this.workoutController,
    required this.trainerController,
    required this.rewardsController,
    required this.onFinished,
  });

  @override
  State<WorkoutTrackerScreen> createState() => _WorkoutTrackerScreenState();
}

class _WorkoutTrackerScreenState extends State<WorkoutTrackerScreen> {
  final List<_ExerciseItem> _exercises = const [
    _ExerciseItem(
      name: 'Push Ups',
      details: '3 sets × 15 reps',
      imagePath: 'assets/images/push_ups.png',
    ),
    _ExerciseItem(
      name: 'Squats',
      details: '4 sets × 12 reps',
      imagePath: 'assets/images/squats.png',
    ),
    _ExerciseItem(
      name: 'Bench Press',
      details: '3 sets × 10 reps',
      imagePath: 'assets/images/bench_press.png',
    ),
    _ExerciseItem(
      name: 'Plank',
      details: '3 sets × 45 sec',
      imagePath: 'assets/images/plank.png',
    ),
  ];

  late final Map<String, bool> _completed;

  Timer? _timer;

  int _elapsedSeconds = 0;

  bool _isTraining = false;
  bool _isFinishing = false;

  @override
  void initState() {
    super.initState();

    // The mockup shows Push Ups and Squats completed,
    // while Bench Press and Plank are still incomplete.
    _completed = {
      for (final exercise in _exercises)
        exercise.name: exercise.name == 'Push Ups' || exercise.name == 'Squats',
    };
  }

  // This determines whether every exercise is complete.
  bool get _allExercisesComplete =>
      _completed.values.every((completed) => completed);

  void _toggleTraining() {
    if (_isTraining) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) {
          return;
        }

        setState(() {
          _elapsedSeconds++;
        });
      });
    }

    setState(() {
      _isTraining = !_isTraining;
    });
  }

  String _formatTime() {
    final minutes = _elapsedSeconds ~/ 60;
    final seconds = _elapsedSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _finishWorkout() async {
    // Prevent the workout from being completed unless
    // every exercise has been checked.
    if (!_allExercisesComplete || _isFinishing) {
      return;
    }

    setState(() {
      _isFinishing = true;
    });

    _timer?.cancel();

    // Save every completed exercise.
    for (final exercise in _exercises) {
      await widget.workoutController.addCompletedWorkout(
        exerciseName: exercise.name,
        category: 'Full Body',
        sets: _setsForExercise(exercise.name),
        reps: _repsForExercise(exercise.name),
        duration: (_elapsedSeconds ~/ 60).clamp(1, 120),
        caloriesBurned: 50,
      );
    }

    // Award trainer XP.
    await widget.trainerController.addXp(100);

    // Increase the trainer streak.
    await widget.trainerController.increaseWorkoutStreak();

    // Add a new reward after the workout.
    final reward = PokemonReward(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      pokemonName: 'Pikachu',
      pokemonType: 'Electric',
      xpEarned: 100,
      gymBadge: 'Workout Badge',
      achievement: 'Workout Completed',
      rarity: 'Common',
    );

    await widget.rewardsController.addReward(reward);

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Workout completed! You earned 100 XP and a Pokémon reward.',
        ),
      ),
    );

    // Send the user directly to the Rewards Vault.
    widget.onFinished();
  }

  int _setsForExercise(String exercise) {
    switch (exercise) {
      case 'Squats':
        return 4;
      default:
        return 3;
    }
  }

  int _repsForExercise(String exercise) {
    switch (exercise) {
      case 'Push Ups':
        return 15;
      case 'Squats':
        return 12;
      case 'Bench Press':
        return 10;
      default:
        return 45;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        children: [
          Text(
            'Active Gym Workout',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: 4),

          Text(
            'Perform exercises in sequence to unlock bonus items!',
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: 20),

          // Elapsed tracking time card.
          Container(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE6E6E6)),
            ),
            child: Column(
              children: [
                const Text(
                  'ELAPSED TRACKING TIME',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF666666),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  _formatTime(),
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF5350),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Exercise cards.
          ..._exercises.map(_buildExerciseCard),

          const SizedBox(height: 8),

          SizedBox(
            height: 46,
            width: double.infinity,
            child: PrimaryButton(
              label: _isTraining
                  ? 'Pause Training Session'
                  : 'Resume Training Session',
              onPressed: _toggleTraining,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 46,
            width: double.infinity,
            child: PrimaryButton(
              label: 'Finish & Claim Gym Badges',
              outlined: true,

              // The button is disabled until every exercise
              // has been completed.
              onPressed: _allExercisesComplete && !_isFinishing
                  ? _finishWorkout
                  : null,
            ),
          ),

          if (!_allExercisesComplete)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Complete all exercises to claim your gym badges.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Color(0xFF666666)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(_ExerciseItem exercise) {
    final isCompleted = _completed[exercise.name] ?? false;

    return GestureDetector(
      onTap: () {
        setState(() {
          _completed[exercise.name] = !isCompleted;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isCompleted
                ? const Color(0xFF43A047)
                : const Color(0xFFE6E6E6),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 44,
              height: 40,
              child: Image.asset(exercise.imagePath, fit: BoxFit.contain),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    exercise.details,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? const Color(0xFF43A047)
                    : const Color(0xFFF1F2F3),
              ),
              child: Icon(
                Icons.check,
                size: 16,
                color: isCompleted ? Colors.white : const Color(0xFF707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseItem {
  final String name;
  final String details;
  final String imagePath;

  const _ExerciseItem({
    required this.name,
    required this.details,
    required this.imagePath,
  });
}
