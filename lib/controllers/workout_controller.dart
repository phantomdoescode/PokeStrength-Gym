import 'package:flutter/foundation.dart';
import '../data/exercise.dart';
import '../data/exercise_catalog.dart';
import '../data/workout.dart';
import '../services/storage_service.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> workouts = [];
  List<Exercise> activeExercises = [];
  bool isLoading = false;

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();

    workouts = await StorageService.loadWorkouts();
    activeExercises = await StorageService.loadActiveExercises();

    // Keep a starter workout that matches the
    // original mockup on first launch.
    if (activeExercises.isEmpty) {
      activeExercises = [
        ExerciseCatalog.all.firstWhere(
          (exercise) => exercise.name == 'Push Ups',
        ),
        ExerciseCatalog.all.firstWhere(
          (exercise) => exercise.name == 'Bodyweight Squats',
        ),
        ExerciseCatalog.all.firstWhere(
          (exercise) => exercise.name == 'Bench Press',
        ),
        Exercise(
          id: 'core-01',
          name: 'Plank',
          category: 'Core',
          sets: 3,
          reps: 1,
          duration: 3,
          caloriesBurned: 30,
        ),
      ];

      await StorageService.saveActiveExercises(activeExercises);
    }

    // Create sample workout history if none exists.
    if (workouts.isEmpty) {
      final now = DateTime.now();

      workouts = List.generate(
        42,
        (index) => Workout(
          id: 'sample-$index',
          exerciseName: index.isEven ? 'Push Ups' : 'Squats',
          category: index.isEven ? 'Chest' : 'Legs',
          sets: 3,
          reps: 12 + (index % 4),
          duration: 10 + (index % 10),
          caloriesBurned: 50 + (index % 30),
          completionDate: now.subtract(Duration(days: index)),
          isCompleted: true,
        ),
      );

      await StorageService.saveWorkouts(workouts);
    }

    isLoading = false;
    notifyListeners();
  }

  bool containsExercise(String exerciseId) {
    return activeExercises.any((exercise) => exercise.id == exerciseId);
  }

  Future<bool> addExerciseToWorkout(Exercise exercise) async {
    if (containsExercise(exercise.id)) {
      return false;
    }

    activeExercises.add(exercise);

    await StorageService.saveActiveExercises(activeExercises);

    notifyListeners();

    return true;
  }

  Future<void> removeExerciseFromWorkout(String exerciseId) async {
    activeExercises.removeWhere((exercise) => exercise.id == exerciseId);

    await StorageService.saveActiveExercises(activeExercises);

    notifyListeners();
  }

  Future<void> clearActiveWorkout() async {
    activeExercises.clear();

    await StorageService.saveActiveExercises(activeExercises);

    notifyListeners();
  }

  Future<void> addWorkout(Workout workout) async {
    workouts.add(workout);

    await StorageService.saveWorkouts(workouts);

    notifyListeners();
  }

  Future<void> addCompletedWorkout({
    required String exerciseName,
    required String category,
    required int sets,
    required int reps,
    int duration = 0,
    double caloriesBurned = 0,
  }) async {
    final workout = Workout(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      exerciseName: exerciseName,
      category: category,
      sets: sets,
      reps: reps,
      duration: duration,
      caloriesBurned: caloriesBurned.round(),
      completionDate: DateTime.now(),
      isCompleted: true,
    );

    await addWorkout(workout);
  }

  int get totalCompletedWorkouts =>
      workouts.where((workout) => workout.isCompleted).length;
}
