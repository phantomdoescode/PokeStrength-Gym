import 'package:flutter/foundation.dart';
import '../data/member.dart';
import '../services/storage_service.dart';

class TrainerController extends ChangeNotifier {
  // XP required to reach the next level.
  static const int xpPerLevel = 2500;

  Member? member;
  bool isLoading = false;

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();

    member = await StorageService.loadMember();

    if (member == null) {
      // Starter profile.
      member = Member(
        id: 'trainer-001',
        name: 'Masaharu Kayama',
        age: 18,
        height: 170,
        weight: 65,
        fitnessLevel: 'Beginner',
        workoutStreak: 7,
        totalXp: 400,
        currentLevel: 1,
      );

      await StorageService.saveMember(member!);
    } else if (member!.currentLevel == 12 && member!.totalXp == 3250) {
      member = member!.copyWith(totalXp: 400, currentLevel: 1);
      await StorageService.saveMember(member!);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> createTrainer({
    required String name,
    required int age,
    required double height,
    required double weight,
    required String fitnessLevel,
  }) async {
    member = Member(
      id: 'trainer-001',
      name: name,
      age: age,
      height: height,
      weight: weight,
      fitnessLevel: fitnessLevel,
      workoutStreak: 0,
      totalXp: 0,
      currentLevel: 1,
    );

    await StorageService.saveMember(member!);

    notifyListeners();
  }

  Future<void> updateProfile({
    required String name,
    required int age,
    required double height,
    required double weight,
    required String fitnessLevel,
  }) async {
    if (member == null) {
      return;
    }

    member = member!.copyWith(
      name: name,
      age: age,
      height: height,
      weight: weight,
      fitnessLevel: fitnessLevel,
    );

    await StorageService.saveMember(member!);

    notifyListeners();
  }

  Future<void> addXp(int amount) async {
    if (member == null || amount <= 0) {
      return;
    }

    var currentXp = member!.totalXp + amount;
    var currentLevel = member!.currentLevel;

    while (currentXp >= xpPerLevel) {
      currentXp -= xpPerLevel;
      currentLevel++;
    }

    member = member!.copyWith(totalXp: currentXp, currentLevel: currentLevel);

    await StorageService.saveMember(member!);

    notifyListeners();
  }

  Future<void> increaseWorkoutStreak() async {
    if (member == null) {
      return;
    }

    member = member!.copyWith(workoutStreak: member!.workoutStreak + 1);

    await StorageService.saveMember(member!);

    notifyListeners();
  }
}
