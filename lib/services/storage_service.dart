import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/member.dart';
import '../data/pokemon_reward.dart';
import '../data/workout.dart';

class StorageService {
  // These keys identify the three types of data stored locally.
  static const String memberKey = 'member';
  static const String workoutKey = 'workouts';
  static const String rewardsKey = 'rewards';

  // Saves one member as a JSON string.
  static Future<void> saveMember(Member member) async {
    final prefs = await SharedPreferences.getInstance();

    // toJson converts the object into a Map, then jsonEncode
    // converts the Map into a String that shared_preferences can save.
    await prefs.setString(memberKey, jsonEncode(member.toJson()));
  }

  // Loads the saved member from shared_preferences.
  static Future<Member?> loadMember() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(memberKey);

    if (data == null) {
      return null;
    }

    // jsonDecode converts the stored String back into a Map,
    // which Member.fromJson then converts into a Member object.
    return Member.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }

  // Saves the entire workout lists as one JSON string.
  static Future<void> saveWorkouts(List<Workout> workouts) async {
    final prefs = await SharedPreferences.getInstance();
    // Every workout is converted into a Map before encoding the list.
    final data = workouts.map((workout) => workout.toJson()).toList();
    await prefs.setString(workoutKey, jsonEncode(data));
  }

  static Future<List<Workout>> loadWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(workoutKey);

    // An empty list means there are no workouts saved yet.
    if (data == null) {
      return [];
    }

    final decoded = jsonDecode(data) as List;

    // Converts every saved Map back into a Workout object.
    return decoded
        .map((item) => Workout.fromJson(Map<String, dynamic>.from(item as Map)))
        .toList();
  }

  // Saves the user's complete Pokémon reward collection.
  static Future<void> saveRewards(List<PokemonReward> rewards) async {
    final prefs = await SharedPreferences.getInstance();
    final data = rewards.map((reward) => reward.toJson()).toList();
    await prefs.setString(rewardsKey, jsonEncode(data));
  }

  // Loads all collected Pokémon rewards from shared_preferences.
  static Future<List<PokemonReward>> loadRewards() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(rewardsKey);

    if (data == null) {
      return [];
    }

    final decoded = jsonDecode(data) as List;

    return decoded
        .map(
          (item) =>
              PokemonReward.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }
}
