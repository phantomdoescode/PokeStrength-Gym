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
      // Starter Pokémon based on the current rarity/XP system.
      rewards = [
        _createStarterReward(
          pokemonName: 'Pikachu',
          id: 'reward-001',
          gymBadge: 'Voltage Badge',
          achievement: 'Starter Companion',
        ),
        _createStarterReward(
          pokemonName: 'Squirtle',
          id: 'reward-002',
          gymBadge: 'Aqua Badge',
          achievement: 'Hydration Hero',
        ),
        _createStarterReward(
          pokemonName: 'Charmander',
          id: 'reward-003',
          gymBadge: 'Blaze Badge',
          achievement: 'Heat Seeker',
        ),
        _createStarterReward(
          pokemonName: 'Machop',
          id: 'reward-004',
          gymBadge: 'Power Badge',
          achievement: 'Strength Trainer',
        ),
      ];
    } else {
      // Update previously saved rewards to the current
      // catalog rarity and XP values.
      rewards = _updateSavedRewards(rewards);
    }

    // Save the updated values back to SharedPreferences.
    await StorageService.saveRewards(rewards);

    isLoading = false;
    notifyListeners();
  }

  PokemonReward _createStarterReward({
    required String pokemonName,
    required String id,
    required String gymBadge,
    required String achievement,
  }) {
    final catalogReward = PokemonCatalog.rewards.firstWhere(
      (reward) => reward.pokemonName.toLowerCase() == pokemonName.toLowerCase(),
    );

    return PokemonReward(
      id: id,
      pokemonName: catalogReward.pokemonName,
      pokemonType: catalogReward.pokemonType,
      xpEarned: catalogReward.xpEarned,
      gymBadge: gymBadge,
      achievement: achievement,
      rarity: catalogReward.rarity,
    );
  }

  List<PokemonReward> _updateSavedRewards(List<PokemonReward> savedRewards) {
    final catalogRewards = PokemonCatalog.rewards;

    return savedRewards.map((savedReward) {
      PokemonReward? catalogReward;

      for (final reward in catalogRewards) {
        if (reward.pokemonName.trim().toLowerCase() ==
            savedReward.pokemonName.trim().toLowerCase()) {
          catalogReward = reward;
          break;
        }
      }

      // Keep the saved reward unchanged if it is not found
      // in the current 151-Pokémon catalog.
      if (catalogReward == null) {
        return savedReward;
      }

      return PokemonReward(
        id: savedReward.id,
        pokemonName: catalogReward.pokemonName,
        pokemonType: catalogReward.pokemonType,
        xpEarned: catalogReward.xpEarned,
        gymBadge: savedReward.gymBadge,
        achievement: savedReward.achievement,
        rarity: catalogReward.rarity,
      );
    }).toList();
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
