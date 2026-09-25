import 'package:flutter/foundation.dart';
import '../data/member.dart';
import '../services/storage_service.dart';

class TrainerController extends ChangeNotifier {
  Member? _member;
  bool _isLoading = true;
  Member? get member => _member;
  bool get isLoading => _isLoading;

  // Initializes the trainer data when the application starts.
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    _member = await StorageService.loadMember();

    if (_member == null) {
      // Sample trainer information is used so the first launch
      // resembles the project's Figma mockup.
      _member = Member(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Masaharu Kayama',
        age: 18,
        height: 170,
        weight: 65,
        fitnessLevel: 'Beginner',
        workoutStreak: 7,
        totalXp: 3250,
        currentLevel: 12,
      );
      await StorageService.saveMember(_member!);
    }

    _isLoading = false;
    notifyListeners();
  }

  // Creates a new trainer profile.
  Future<void> createTrainer(String name) async {
    _member = Member(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      age: 18,
      height: 170,
      weight: 65,
      fitnessLevel: 'Beginner',
      workoutStreak: 0,
      totalXp: 0,
      currentLevel: 1,
    );
    await StorageService.saveMember(_member!);

    notifyListeners();
  }

  // Updates the trainer information entered on the Edit Trainer Card screen.
  Future<void> updateProfile({
    required String name,
    required int age,
    required double height,
    required double weight,
    required String fitnessLevel,
  }) async {
    if (_member == null) {
      return;
    }

    // copyWith preserves the trainer's ID, XP, level, and streak.
    _member = _member!.copyWith(
      name: name,
      age: age,
      height: height,
      weight: weight,
      fitnessLevel: fitnessLevel,
    );
    await StorageService.saveMember(_member!);

    notifyListeners();
  }

  // Adds XP after successfully completing a workout.
  Future<void> addXp(int amount) async {
    if (_member == null) {
      return;
    }

    final newXp = _member!.totalXp + amount;

    // The current MVP uses a 5,000 XP level threshold.
    // The trainer level increases whenever another 5,000 XP is reached.
    final additionalLevels = newXp ~/ 5000 - _member!.totalXp ~/ 5000;

    _member = _member!.copyWith(
      totalXp: newXp,
      currentLevel: _member!.currentLevel + additionalLevels,
    );
    await StorageService.saveMember(_member!);

    notifyListeners();
  }

  // Increases the trainer's workout streak after a completed workout.
  Future<void> increaseWorkoutStreak() async {
    if (_member == null) {
      return;
    }

    _member = _member!.copyWith(workoutStreak: _member!.workoutStreak + 1);
    await StorageService.saveMember(_member!);

    notifyListeners();
  }
}
