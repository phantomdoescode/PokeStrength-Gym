import 'dart:async';
import 'package:flutter/material.dart';
import '../controllers/rewards_controller.dart';
import '../controllers/trainer_controller.dart';
import '../controllers/workout_controller.dart';
import '../data/exercise.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

class WorkoutTrackerScreen extends StatefulWidget {
  final WorkoutController workoutController;
  final TrainerController trainerController;
  final RewardsController rewardsController;
  final VoidCallback onFinished;
  final VoidCallback onAddExercises;

  const WorkoutTrackerScreen({
    super.key,
    required this.workoutController,
    required this.trainerController,
    required this.rewardsController,
    required this.onFinished,
    required this.onAddExercises,
  });

  @override
  State<WorkoutTrackerScreen> createState() => _WorkoutTrackerScreenState();
}

class _WorkoutTrackerScreenState extends State<WorkoutTrackerScreen> {
  final Map<String, bool> _completed = {};
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _isRunning = false;
  bool _hasClaimed = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  bool _areAllCompleted(List<Exercise> exercises) {
    if (exercises.isEmpty) {
      return false;
    }

    return exercises.every((exercise) => _completed[exercise.id] ?? false);
  }

  void _toggleExercise(String exerciseId, bool? value) {
    setState(() {
      _completed[exerciseId] = value ?? false;
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();

      setState(() {
        _isRunning = false;
      });

      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      setState(() {
        _elapsedSeconds++;
      });
    });

    setState(() {
      _isRunning = true;
    });
  }

  Future<void> _finishWorkout(List<Exercise> exercises) async {
    if (!_areAllCompleted(exercises) || _hasClaimed) {
      return;
    }

    _hasClaimed = true;
    _timer?.cancel();

    for (final exercise in exercises) {
      await widget.workoutController.addCompletedWorkout(
        exerciseName: exercise.name,
        category: exercise.category,
        sets: exercise.sets,
        reps: exercise.reps,
        duration: exercise.duration,
        caloriesBurned: exercise.caloriesBurned,
      );
    }

    final newReward = await widget.rewardsController.unlockNextPokemon();

    if (newReward != null) {
      await widget.trainerController.addXp(newReward.xpEarned);
    }

    await widget.trainerController.increaseWorkoutStreak();

    await widget.workoutController.clearActiveWorkout();

    if (!mounted) return;
    widget.onFinished();
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${remaining.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.workoutController,
      builder: (context, _) {
        final exercises = widget.workoutController.activeExercises;
        final allCompleted = _areAllCompleted(exercises);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Active Gym Workout'),
            actions: [
              IconButton(
                tooltip: 'Add exercises',
                onPressed: widget.onAddExercises,
                icon: const Icon(Icons.add),
              ),
            ],
          ),

          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.screen),
            children: [
              Text(
                'Build Your Workout',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 4),

              Text(
                'Add exercises from the library and complete them to earn rewards.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

              // Training timer.
              Container(
                padding: const EdgeInsets.all(20),
                decoration: AppTheme.cardDecoration(context, radius: 18),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: AppTheme.secondary,
                      child: Icon(
                        Icons.timer_outlined,
                        color: AppTheme.textPrimary,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Elapsed Tracking Time',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          const SizedBox(height: 3),

                          Text(
                            _formatDuration(_elapsedSeconds),
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 22,
                                  color: AppTheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: _toggleTimer,
                      icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Add from Library.
              OutlinedButton.icon(
                onPressed: widget.onAddExercises,
                icon: const Icon(Icons.add),
                label: const Text('Add Exercises from Library'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primary,
                  side: const BorderSide(color: AppTheme.primary),
                  minimumSize: const Size.fromHeight(48),
                ),
              ),

              const SizedBox(height: 20),

              if (exercises.isEmpty)
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: AppTheme.cardDecoration(context, radius: 18),
                  child: const Text(
                    'No exercises have been added yet.',
                    textAlign: TextAlign.center,
                  ),
                ),

              for (final exercise in exercises) ...[
                _ExerciseCard(
                  exercise: exercise,
                  completed: _completed[exercise.id] ?? false,
                  onChanged: (value) {
                    _toggleExercise(exercise.id, value);
                  },
                  onRemove: () async {
                    await widget.workoutController.removeExerciseFromWorkout(
                      exercise.id,
                    );

                    setState(() {
                      _completed.remove(exercise.id);
                    });
                  },
                ),

                const SizedBox(height: 10),
              ],

              const SizedBox(height: 6),

              PrimaryButton(
                label: allCompleted
                    ? 'Finish & Claim Gym Badges'
                    : 'Complete All Exercises First',
                onPressed: allCompleted
                    ? () => _finishWorkout(exercises)
                    : null,
              ),

              const SizedBox(height: 10),

              if (!allCompleted)
                Text(
                  'Finish & Claim Gym Badges will unlock after every exercise is completed.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final bool completed;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onRemove;

  const _ExerciseCard({
    required this.exercise,
    required this.completed,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: AppTheme.cardDecoration(context, radius: 14),
      child: Row(
        children: [
          Checkbox(
            value: completed,
            onChanged: onChanged,
            activeColor: AppTheme.success,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
                ),

                const SizedBox(height: 3),

                Text(
                  '${exercise.sets} sets • '
                  '${exercise.reps} reps • '
                  '${exercise.duration} min',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? AppTheme.success : Colors.grey,
          ),

          IconButton(
            tooltip: 'Remove exercise',
            onPressed: onRemove,
            icon: const Icon(Icons.close, size: 19),
          ),
        ],
      ),
    );
  }
}
