import 'package:flutter/foundation.dart';
import '../data/workout.dart';
import '../services/storage_service.dart';

class WorkoutController extends ChangeNotifier {
  List<Workout> _workouts = [];
  List<Workout> get workouts => List.unmodifiable(_workouts);
  int get totalWorkouts => _workouts.length;
  int get completedWorkouts =>
      _workouts.where((workout) => workout.isCompleted).length;

  // Loads saved workout history.
  //
  // The first launch contains sample workout records so that
  // the application has meaningful data while demonstrating the UI.
  Future<void> initialize() async {
    _workouts = await StorageService.loadWorkouts();

    if (_workouts.isEmpty) {
      _workouts = _createSampleWorkouts();

      await StorageService.saveWorkouts(_workouts);
    }

    notifyListeners();
  }

  // Saves a single workout and refreshes the screens using this controller.
  Future<void> addWorkout(Workout workout) async {
    _workouts.add(workout);

    await StorageService.saveWorkouts(_workouts);

    notifyListeners();
  }

  // Creates and saves a completed workout from the active workout screen.
  Future<void> addCompletedWorkout({
    required String exerciseName,
    required String category,
    required int sets,
    required int reps,
    required int duration,
    required int caloriesBurned,
  }) async {
    final workout = Workout(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      exerciseName: exerciseName,
      category: category,
      sets: sets,
      reps: reps,
      duration: duration,
      caloriesBurned: caloriesBurned,
      completionDate: DateTime.now(),
      isCompleted: true,
    );

    await addWorkout(workout);
  }

  // Creates sample records so the application can resemble the
  // completed-state mockup immediately after first launch.
  List<Workout> _createSampleWorkouts() {
    return List.generate(
      42,
      (index) => Workout(
        id: 'sample-${index + 1}',
        exerciseName: 'Workout ${index + 1}',
        category: 'Full Body',
        sets: 3,
        reps: 12,
        duration: 35,
        caloriesBurned: 280,
        completionDate: DateTime.now().subtract(Duration(days: index)),
        isCompleted: true,
      ),
    );
  }
}
