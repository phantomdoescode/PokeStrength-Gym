import 'package:flutter/foundation.dart';
import '../data/pokemon_reward.dart';
import '../services/storage_service.dart';

class RewardsController extends ChangeNotifier {
  List<PokemonReward> _rewards = [];
  List<PokemonReward> get rewards => List.unmodifiable(_rewards);

  // Loads the saved Pokémon collection.
  // Sample rewards are created on the first launch

  Future<void> initialize() async {
    _rewards = await StorageService.loadRewards();

    if (_rewards.isEmpty) {
      _rewards = _createSampleRewards();
      await StorageService.saveRewards(_rewards);
    }
    notifyListeners();
  }

  // Adds a new Pokémon reward to the collection.
  Future<void> addReward(PokemonReward reward) async {
    _rewards.add(reward);
    await StorageService.saveRewards(_rewards);

    notifyListeners();
  }

  List<PokemonReward> _createSampleRewards() {
    return const [
      PokemonReward(
        id: 'reward-1',
        pokemonName: 'Pikachu',
        pokemonType: 'Electric',
        xpEarned: 500,
        gymBadge: '7-Day Streak',
        achievement: 'First Week',
        rarity: 'Common',
      ),
      PokemonReward(
        id: 'reward-2',
        pokemonName: 'Squirtle',
        pokemonType: 'Water',
        xpEarned: 200,
        gymBadge: 'First Workout',
        achievement: 'First Workout',
        rarity: 'Uncommon',
      ),
      PokemonReward(
        id: 'reward-3',
        pokemonName: 'Charmander',
        pokemonType: 'Fire',
        xpEarned: 350,
        gymBadge: '1000 XP Club',
        achievement: 'Fire Up',
        rarity: 'Uncommon',
      ),
      PokemonReward(
        id: 'reward-4',
        pokemonName: 'Machop',
        pokemonType: 'Fighting',
        xpEarned: 800,
        gymBadge: '1000 XP Club',
        achievement: 'Strength Training',
        rarity: 'Rare',
      ),
    ];
  }
}
