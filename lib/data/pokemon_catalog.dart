import 'pokemon_reward.dart';

class PokemonCatalogEntry {
  final int number;
  final String name;
  final String type;

  const PokemonCatalogEntry({
    required this.number,
    required this.name,
    required this.type,
  });
}

class PokemonCatalog {
  static const List<PokemonCatalogEntry> entries = [
    PokemonCatalogEntry(number: 1, name: 'Bulbasaur', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 2, name: 'Ivysaur', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 3, name: 'Venusaur', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 4, name: 'Charmander', type: 'Fire'),
    PokemonCatalogEntry(number: 5, name: 'Charmeleon', type: 'Fire'),
    PokemonCatalogEntry(number: 6, name: 'Charizard', type: 'Fire/Flying'),
    PokemonCatalogEntry(number: 7, name: 'Squirtle', type: 'Water'),
    PokemonCatalogEntry(number: 8, name: 'Wartortle', type: 'Water'),
    PokemonCatalogEntry(number: 9, name: 'Blastoise', type: 'Water'),
    PokemonCatalogEntry(number: 10, name: 'Caterpie', type: 'Bug'),
    PokemonCatalogEntry(number: 11, name: 'Metapod', type: 'Bug'),
    PokemonCatalogEntry(number: 12, name: 'Butterfree', type: 'Bug/Flying'),
    PokemonCatalogEntry(number: 13, name: 'Weedle', type: 'Bug/Poison'),
    PokemonCatalogEntry(number: 14, name: 'Kakuna', type: 'Bug/Poison'),
    PokemonCatalogEntry(number: 15, name: 'Beedrill', type: 'Bug/Poison'),
    PokemonCatalogEntry(number: 16, name: 'Pidgey', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 17, name: 'Pidgeotto', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 18, name: 'Pidgeot', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 19, name: 'Rattata', type: 'Normal'),
    PokemonCatalogEntry(number: 20, name: 'Raticate', type: 'Normal'),
    PokemonCatalogEntry(number: 21, name: 'Spearow', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 22, name: 'Fearow', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 23, name: 'Ekans', type: 'Poison'),
    PokemonCatalogEntry(number: 24, name: 'Arbok', type: 'Poison'),
    PokemonCatalogEntry(number: 25, name: 'Pikachu', type: 'Electric'),
    PokemonCatalogEntry(number: 26, name: 'Raichu', type: 'Electric'),
    PokemonCatalogEntry(number: 27, name: 'Sandshrew', type: 'Ground'),
    PokemonCatalogEntry(number: 28, name: 'Sandslash', type: 'Ground'),
    PokemonCatalogEntry(number: 29, name: 'Nidoran♀', type: 'Poison'),
    PokemonCatalogEntry(number: 30, name: 'Nidorina', type: 'Poison'),
    PokemonCatalogEntry(number: 31, name: 'Nidoqueen', type: 'Poison/Ground'),
    PokemonCatalogEntry(number: 32, name: 'Nidoran♂', type: 'Poison'),
    PokemonCatalogEntry(number: 33, name: 'Nidorino', type: 'Poison'),
    PokemonCatalogEntry(number: 34, name: 'Nidoking', type: 'Poison/Ground'),
    PokemonCatalogEntry(number: 35, name: 'Clefairy', type: 'Normal'),
    PokemonCatalogEntry(number: 36, name: 'Clefable', type: 'Normal'),
    PokemonCatalogEntry(number: 37, name: 'Vulpix', type: 'Fire'),
    PokemonCatalogEntry(number: 38, name: 'Ninetales', type: 'Fire'),
    PokemonCatalogEntry(number: 39, name: 'Jigglypuff', type: 'Normal'),
    PokemonCatalogEntry(number: 40, name: 'Wigglytuff', type: 'Normal'),
    PokemonCatalogEntry(number: 41, name: 'Zubat', type: 'Poison/Flying'),
    PokemonCatalogEntry(number: 42, name: 'Golbat', type: 'Poison/Flying'),
    PokemonCatalogEntry(number: 43, name: 'Oddish', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 44, name: 'Gloom', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 45, name: 'Vileplume', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 46, name: 'Paras', type: 'Bug/Grass'),
    PokemonCatalogEntry(number: 47, name: 'Parasect', type: 'Bug/Grass'),
    PokemonCatalogEntry(number: 48, name: 'Venonat', type: 'Bug/Poison'),
    PokemonCatalogEntry(number: 49, name: 'Venomoth', type: 'Bug/Poison'),
    PokemonCatalogEntry(number: 50, name: 'Diglett', type: 'Ground'),
    PokemonCatalogEntry(number: 51, name: 'Dugtrio', type: 'Ground'),
    PokemonCatalogEntry(number: 52, name: 'Meowth', type: 'Normal'),
    PokemonCatalogEntry(number: 53, name: 'Persian', type: 'Normal'),
    PokemonCatalogEntry(number: 54, name: 'Psyduck', type: 'Water'),
    PokemonCatalogEntry(number: 55, name: 'Golduck', type: 'Water'),
    PokemonCatalogEntry(number: 56, name: 'Mankey', type: 'Fighting'),
    PokemonCatalogEntry(number: 57, name: 'Primeape', type: 'Fighting'),
    PokemonCatalogEntry(number: 58, name: 'Growlithe', type: 'Fire'),
    PokemonCatalogEntry(number: 59, name: 'Arcanine', type: 'Fire'),
    PokemonCatalogEntry(number: 60, name: 'Poliwag', type: 'Water'),
    PokemonCatalogEntry(number: 61, name: 'Poliwhirl', type: 'Water'),
    PokemonCatalogEntry(number: 62, name: 'Poliwrath', type: 'Water/Fighting'),
    PokemonCatalogEntry(number: 63, name: 'Abra', type: 'Psychic'),
    PokemonCatalogEntry(number: 64, name: 'Kadabra', type: 'Psychic'),
    PokemonCatalogEntry(number: 65, name: 'Alakazam', type: 'Psychic'),
    PokemonCatalogEntry(number: 66, name: 'Machop', type: 'Fighting'),
    PokemonCatalogEntry(number: 67, name: 'Machoke', type: 'Fighting'),
    PokemonCatalogEntry(number: 68, name: 'Machamp', type: 'Fighting'),
    PokemonCatalogEntry(number: 69, name: 'Bellsprout', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 70, name: 'Weepinbell', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 71, name: 'Victreebel', type: 'Grass/Poison'),
    PokemonCatalogEntry(number: 72, name: 'Tentacool', type: 'Water/Poison'),
    PokemonCatalogEntry(number: 73, name: 'Tentacruel', type: 'Water/Poison'),
    PokemonCatalogEntry(number: 74, name: 'Geodude', type: 'Rock/Ground'),
    PokemonCatalogEntry(number: 75, name: 'Graveler', type: 'Rock/Ground'),
    PokemonCatalogEntry(number: 76, name: 'Golem', type: 'Rock/Ground'),
    PokemonCatalogEntry(number: 77, name: 'Ponyta', type: 'Fire'),
    PokemonCatalogEntry(number: 78, name: 'Rapidash', type: 'Fire'),
    PokemonCatalogEntry(number: 79, name: 'Slowpoke', type: 'Water/Psychic'),
    PokemonCatalogEntry(number: 80, name: 'Slowbro', type: 'Water/Psychic'),
    PokemonCatalogEntry(number: 81, name: 'Magnemite', type: 'Electric'),
    PokemonCatalogEntry(number: 82, name: 'Magneton', type: 'Electric'),
    PokemonCatalogEntry(number: 83, name: "Farfetch'd", type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 84, name: 'Doduo', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 85, name: 'Dodrio', type: 'Normal/Flying'),
    PokemonCatalogEntry(number: 86, name: 'Seel', type: 'Water'),
    PokemonCatalogEntry(number: 87, name: 'Dewgong', type: 'Water/Ice'),
    PokemonCatalogEntry(number: 88, name: 'Grimer', type: 'Poison'),
    PokemonCatalogEntry(number: 89, name: 'Muk', type: 'Poison'),
    PokemonCatalogEntry(number: 90, name: 'Shellder', type: 'Water'),
    PokemonCatalogEntry(number: 91, name: 'Cloyster', type: 'Water/Ice'),
    PokemonCatalogEntry(number: 92, name: 'Gastly', type: 'Ghost/Poison'),
    PokemonCatalogEntry(number: 93, name: 'Haunter', type: 'Ghost/Poison'),
    PokemonCatalogEntry(number: 94, name: 'Gengar', type: 'Ghost/Poison'),
    PokemonCatalogEntry(number: 95, name: 'Onix', type: 'Rock/Ground'),
    PokemonCatalogEntry(number: 96, name: 'Drowzee', type: 'Psychic'),
    PokemonCatalogEntry(number: 97, name: 'Hypno', type: 'Psychic'),
    PokemonCatalogEntry(number: 98, name: 'Krabby', type: 'Water'),
    PokemonCatalogEntry(number: 99, name: 'Kingler', type: 'Water'),
    PokemonCatalogEntry(number: 100, name: 'Voltorb', type: 'Electric'),
    PokemonCatalogEntry(number: 101, name: 'Electrode', type: 'Electric'),
    PokemonCatalogEntry(number: 102, name: 'Exeggcute', type: 'Grass/Psychic'),
    PokemonCatalogEntry(number: 103, name: 'Exeggutor', type: 'Grass/Psychic'),
    PokemonCatalogEntry(number: 104, name: 'Cubone', type: 'Ground'),
    PokemonCatalogEntry(number: 105, name: 'Marowak', type: 'Ground'),
    PokemonCatalogEntry(number: 106, name: 'Hitmonlee', type: 'Fighting'),
    PokemonCatalogEntry(number: 107, name: 'Hitmonchan', type: 'Fighting'),
    PokemonCatalogEntry(number: 108, name: 'Lickitung', type: 'Normal'),
    PokemonCatalogEntry(number: 109, name: 'Koffing', type: 'Poison'),
    PokemonCatalogEntry(number: 110, name: 'Weezing', type: 'Poison'),
    PokemonCatalogEntry(number: 111, name: 'Rhyhorn', type: 'Ground/Rock'),
    PokemonCatalogEntry(number: 112, name: 'Rhydon', type: 'Ground/Rock'),
    PokemonCatalogEntry(number: 113, name: 'Chansey', type: 'Normal'),
    PokemonCatalogEntry(number: 114, name: 'Tangela', type: 'Grass'),
    PokemonCatalogEntry(number: 115, name: 'Kangaskhan', type: 'Normal'),
    PokemonCatalogEntry(number: 116, name: 'Horsea', type: 'Water'),
    PokemonCatalogEntry(number: 117, name: 'Seadra', type: 'Water'),
    PokemonCatalogEntry(number: 118, name: 'Goldeen', type: 'Water'),
    PokemonCatalogEntry(number: 119, name: 'Seaking', type: 'Water'),
    PokemonCatalogEntry(number: 120, name: 'Staryu', type: 'Water'),
    PokemonCatalogEntry(number: 121, name: 'Starmie', type: 'Water/Psychic'),
    PokemonCatalogEntry(number: 122, name: 'Mr. Mime', type: 'Psychic'),
    PokemonCatalogEntry(number: 123, name: 'Scyther', type: 'Bug/Flying'),
    PokemonCatalogEntry(number: 124, name: 'Jynx', type: 'Ice/Psychic'),
    PokemonCatalogEntry(number: 125, name: 'Electabuzz', type: 'Electric'),
    PokemonCatalogEntry(number: 126, name: 'Magmar', type: 'Fire'),
    PokemonCatalogEntry(number: 127, name: 'Pinsir', type: 'Bug'),
    PokemonCatalogEntry(number: 128, name: 'Tauros', type: 'Normal'),
    PokemonCatalogEntry(number: 129, name: 'Magikarp', type: 'Water'),
    PokemonCatalogEntry(number: 130, name: 'Gyarados', type: 'Water/Flying'),
    PokemonCatalogEntry(number: 131, name: 'Lapras', type: 'Water/Ice'),
    PokemonCatalogEntry(number: 132, name: 'Ditto', type: 'Normal'),
    PokemonCatalogEntry(number: 133, name: 'Eevee', type: 'Normal'),
    PokemonCatalogEntry(number: 134, name: 'Vaporeon', type: 'Water'),
    PokemonCatalogEntry(number: 135, name: 'Jolteon', type: 'Electric'),
    PokemonCatalogEntry(number: 136, name: 'Flareon', type: 'Fire'),
    PokemonCatalogEntry(number: 137, name: 'Porygon', type: 'Normal'),
    PokemonCatalogEntry(number: 138, name: 'Omanyte', type: 'Rock/Water'),
    PokemonCatalogEntry(number: 139, name: 'Omastar', type: 'Rock/Water'),
    PokemonCatalogEntry(number: 140, name: 'Kabuto', type: 'Rock/Water'),
    PokemonCatalogEntry(number: 141, name: 'Kabutops', type: 'Rock/Water'),
    PokemonCatalogEntry(number: 142, name: 'Aerodactyl', type: 'Rock/Flying'),
    PokemonCatalogEntry(number: 143, name: 'Snorlax', type: 'Normal'),
    PokemonCatalogEntry(number: 144, name: 'Articuno', type: 'Ice/Flying'),
    PokemonCatalogEntry(number: 145, name: 'Zapdos', type: 'Electric/Flying'),
    PokemonCatalogEntry(number: 146, name: 'Moltres', type: 'Fire/Flying'),
    PokemonCatalogEntry(number: 147, name: 'Dratini', type: 'Dragon'),
    PokemonCatalogEntry(number: 148, name: 'Dragonair', type: 'Dragon'),
    PokemonCatalogEntry(number: 149, name: 'Dragonite', type: 'Dragon/Flying'),
    PokemonCatalogEntry(number: 150, name: 'Mewtwo', type: 'Psychic'),
    PokemonCatalogEntry(number: 151, name: 'Mew', type: 'Psychic'),
  ];

  // Legendary Pokémon
  static const Set<int> legendaryNumbers = {
    144, // Articuno
    145, // Zapdos
    146, // Moltres
    150, // Mewtwo
    151, // Mew
  };

  // Pre-Evolution / Baby Pokémon
  static const Set<int> preEvolutionNumbers = {
    1, // Bulbasaur
    4, // Charmander
    7, // Squirtle
    10, // Caterpie
    13, // Weedle
    16, // Pidgey
    19, // Rattata
    21, // Spearow
    23, // Ekans
    25, // Pikachu
    27, // Sandshrew
    29, // Nidoran♀
    32, // Nidoran♂
    35, // Clefairy
    37, // Vulpix
    39, // Jigglypuff
    41, // Zubat
    43, // Oddish
    46, // Paras
    48, // Venonat
    50, // Diglett
    52, // Meowth
    54, // Psyduck
    56, // Mankey
    58, // Growlithe
    60, // Poliwag
    63, // Abra
    66, // Machop
    69, // Bellsprout
    72, // Tentacool
    74, // Geodude
    77, // Ponyta
    79, // Slowpoke
    81, // Magnemite
    84, // Doduo
    86, // Seel
    88, // Grimer
    90, // Shellder
    92, // Gastly
    95, // Onix
    96, // Drowzee
    98, // Krabby
    100, // Voltorb
    102, // Exeggcute
    104, // Cubone
    108, // Lickitung
    109, // Koffing
    111, // Rhyhorn
    114, // Tangela
    116, // Horsea
    118, // Goldeen
    120, // Staryu
    123, // Scyther
    125, // Electabuzz
    126, // Magmar
    129, // Magikarp
    133, // Eevee
    137, // Porygon
    138, // Omanyte
    140, // Kabuto
    147, // Dratini
  };

  // Middle Evolution Pokémon
  static const Set<int> middleEvolutionNumbers = {
    2, // Ivysaur
    5, // Charmeleon
    8, // Wartortle
    11, // Metapod
    14, // Kakuna
    17, // Pidgeotto
    30, // Nidorina
    33, // Nidorino
    42, // Golbat -> Crobat
    44, // Gloom
    61, // Poliwhirl
    64, // Kadabra
    67, // Machoke
    70, // Weepinbell
    75, // Graveler
    82, // Magneton -> Magnezone
    93, // Haunter
    112, // Rhydon -> Rhyperior
    113, // Chansey -> Blissey
    117, // Seadra -> Kingdra
    125, // Electabuzz -> Electivire
    126, // Magmar -> Magmortar
    148, // Dragonair
  };

  // Final Evolution Pokémon
  static const Set<int> finalEvolutionNumbers = {
    3, // Venusaur
    6, // Charizard
    9, // Blastoise
    12, // Butterfree
    15, // Beedrill
    18, // Pidgeot
    20, // Raticate
    22, // Fearow
    24, // Arbok
    26, // Raichu
    28, // Sandslash
    31, // Nidoqueen
    34, // Nidoking
    36, // Clefable
    38, // Ninetales
    40, // Wigglytuff
    45, // Vileplume
    47, // Parasect
    49, // Venomoth
    51, // Dugtrio
    53, // Persian
    55, // Golduck
    59, // Arcanine
    62, // Poliwrath
    65, // Alakazam
    68, // Machamp
    71, // Victreebel
    73, // Tentacruel
    76, // Golem
    78, // Rapidash
    80, // Slowbro
    85, // Dodrio
    87, // Dewgong
    89, // Muk
    91, // Cloyster
    94, // Gengar
    97, // Hypno
    99, // Kingler
    101, // Electrode
    103, // Exeggutor
    105, // Marowak
    107, // Hitmonchan
    106, // Hitmonlee
    110, // Weezing
    115, // Kangaskhan
    119, // Seaking
    121, // Starmie
    122, // Mr. Mime
    124, // Jynx
    130, // Gyarados
    131, // Lapras
    132, // Ditto
    134, // Vaporeon
    135, // Jolteon
    136, // Flareon
    139, // Omastar
    141, // Kabutops
    142, // Aerodactyl
    143, // Snorlax
    149, // Dragonite
  };

  static List<PokemonReward> get rewards {
    return entries.map(_createReward).toList();
  }

  static PokemonReward _createReward(PokemonCatalogEntry entry) {
    final number = entry.number;
    final isLegendary = legendaryNumbers.contains(number);
    final isPreEvolution = preEvolutionNumbers.contains(number);
    final isMiddleEvolution = middleEvolutionNumbers.contains(number);
    String rarity;

    if (isLegendary) {
      rarity = 'Legendary';
    } else if (isMiddleEvolution) {
      rarity = 'Uncommon';
    } else if (isPreEvolution) {
      rarity = 'Common';
    } else {
      rarity = 'Rare';
    }
    final xpEarned = xpForRarity(rarity);

    return PokemonReward(
      id: 'pokemon-${entry.number.toString().padLeft(3, '0')}',
      pokemonName: entry.name,
      pokemonType: entry.type,
      xpEarned: xpEarned,
      gymBadge: '${entry.type.split('/').first} Badge',
      achievement: 'Pokémon Entry #${entry.number.toString().padLeft(3, '0')}',
      rarity: rarity,
    );
  }

  static int xpForRarity(String rarity) {
    switch (rarity) {
      case 'Common':
        return 100;
      case 'Uncommon':
        return 200;
      case 'Rare':
        return 500;
      case 'Legendary':
        return 1000;
      default:
        return 100;
    }
  }
}
