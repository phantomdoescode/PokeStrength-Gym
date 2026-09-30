import 'package:flutter/foundation.dart';
import '../data/pokemon_catalog.dart';
import '../data/pokemon_reward.dart';
import '../services/storage_service.dart';

class RewardsController extends ChangeNotifier {
  List<PokemonReward> rewards = [];
  bool isLoading = false;

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();

    rewards = await StorageService.loadRewards();

    // Remove duplicate Pokémon from older saved data.
    rewards = _removeDuplicates(rewards);

    if (rewards.isEmpty) {
      // Keep the rewards shown in the original mockup.
      rewards = [
        PokemonReward(
          id: 'reward-001',
          pokemonName: 'Pikachu',
          pokemonType: 'Electric',
          xpEarned: 500,
          gymBadge: 'Voltage Badge',
          achievement: 'Starter Companion',
          rarity: 'Common',
        ),
        PokemonReward(
          id: 'reward-002',
          pokemonName: 'Squirtle',
          pokemonType: 'Water',
          xpEarned: 200,
          gymBadge: 'Aqua Badge',
          achievement: 'Hydration Hero',
          rarity: 'Uncommon',
        ),
        PokemonReward(
          id: 'reward-003',
          pokemonName: 'Charmander',
          pokemonType: 'Fire',
          xpEarned: 350,
          gymBadge: 'Blaze Badge',
          achievement: 'Heat Seeker',
          rarity: 'Uncommon',
        ),
        PokemonReward(
          id: 'reward-004',
          pokemonName: 'Machop',
          pokemonType: 'Fighting',
          xpEarned: 800,
          gymBadge: 'Power Badge',
          achievement: 'Strength Trainer',
          rarity: 'Rare',
        ),
      ];

      rewards = _removeDuplicates(rewards);
    }

    // Saves the cleaned list so old duplicate entries are removed
    // from SharedPreferences as well.
    await StorageService.saveRewards(rewards);

    isLoading = false;
    notifyListeners();
  }

  List<PokemonReward> _removeDuplicates(List<PokemonReward> source) {
    final seen = <String>{};
    final unique = <PokemonReward>[];

    for (final reward in source) {
      final key = reward.pokemonName.trim().toLowerCase();

      if (seen.add(key)) {
        unique.add(reward);
      }
    }

    return unique;
  }

  bool hasReward(String pokemonName) {
    return rewards.any(
      (reward) => reward.pokemonName.toLowerCase() == pokemonName.toLowerCase(),
    );
  }

  Future<bool> addReward(PokemonReward reward) async {
    // Prevent the same Pokémon from being added again.
    if (hasReward(reward.pokemonName)) {
      return false;
    }

    rewards.add(reward);

    await StorageService.saveRewards(rewards);
    notifyListeners();

    return true;
  }

  // Finds the next Pokémon from the 151-Pokémon catalog
  // that the trainer has not collected yet.
  Future<PokemonReward?> unlockNextPokemon() async {
    for (final pokemon in PokemonCatalog.rewards) {
      if (!hasReward(pokemon.pokemonName)) {
        await addReward(pokemon);
        return pokemon;
      }
    }

    // The complete 151-Pokémon collection is already unlocked.
    return null;
  }
}
