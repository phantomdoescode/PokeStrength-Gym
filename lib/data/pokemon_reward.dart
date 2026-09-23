class PokemonReward {
  final String id;
  final String pokemonName;
  final String pokemonType;
  final int xpEarned;
  final String gymBadge;
  final String achievement;
  final String rarity;

  const PokemonReward({
    required this.id,
    required this.pokemonName,
    required this.pokemonType,
    required this.xpEarned,
    required this.gymBadge,
    required this.achievement,
    required this.rarity,
  });

  // Converts the PokemonReward object into a
  // JSON-compatible values for local persistence.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pokemonName': pokemonName,
      'pokemonType': pokemonType,
      'xpEarned': xpEarned,
      'gymBadge': gymBadge,
      'achievement': achievement,
      'rarity': rarity,
    };
  }

  // Creates a reward object from stored JSON data.
  factory PokemonReward.fromJson(Map<String, dynamic> json) {
    return PokemonReward(
      id: json['id'] as String,
      pokemonName: json['pokemonName'] as String,
      pokemonType: json['pokemonType'] as String,
      xpEarned: json['xpEarned'] as int,
      gymBadge: json['gymBadge'] as String,
      achievement: json['achievement'] as String,
      rarity: json['rarity'] as String,
    );
  }
}
