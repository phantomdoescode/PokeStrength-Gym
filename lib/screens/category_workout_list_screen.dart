import 'package:flutter/material.dart';
import '../controllers/workout_controller.dart';
import '../data/exercise_catalog.dart';
import '../theme/app_theme.dart';

class CategoryWorkoutListScreen extends StatelessWidget {
  final String category;
  final String title;
  final WorkoutController workoutController;

  const CategoryWorkoutListScreen({
    super.key,
    required this.category,
    required this.title,
    required this.workoutController,
  });

  @override
  Widget build(BuildContext context) {
    final exercises = ExerciseCatalog.byCategory(category);

    return AnimatedBuilder(
      animation: workoutController,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),

          body: ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.screen),
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];

              final isAdded = workoutController.containsExercise(exercise.id);

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: AppTheme.cardDecoration(context, radius: 18),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppTheme.primary.withValues(
                          alpha: 0.12,
                        ),
                        child: const Icon(
                          Icons.fitness_center,
                          color: AppTheme.primary,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.name,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${exercise.sets} sets • '
                              '${exercise.reps} reps • '
                              '${exercise.duration} min',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 8),

                      if (isAdded)
                        const Icon(Icons.check_circle, color: AppTheme.success)
                      else
                        IconButton(
                          tooltip: 'Add to workout',
                          onPressed: () async {
                            await workoutController.addExerciseToWorkout(
                              exercise,
                            );

                            if (!context.mounted) {
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${exercise.name} added to your workout.',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: AppTheme.primary,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
