class Member {
  final String id;
  final String name;
  final int age;
  final double height;
  final double weight;
  final String fitnessLevel;
  final int workoutStreak;
  final int totalXp;
  final int currentLevel;

  const Member({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.fitnessLevel,
    required this.workoutStreak,
    required this.totalXp,
    required this.currentLevel,
  });

  // copyWith creates a new instance of Member with
  // updated values for the specified fields.
  Member copyWith({
    String? id,
    String? name,
    int? age,
    double? height,
    double? weight,
    String? fitnessLevel,
    int? workoutStreak,
    int? totalXp,
    int? currentLevel,
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      workoutStreak: workoutStreak ?? this.workoutStreak,
      totalXp: totalXp ?? this.totalXp,
      currentLevel: currentLevel ?? this.currentLevel,
    );
  }

  // Converts the Member object into a Map so it can
  // later be converted into JSON for storage (shared_preferences).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'fitnessLevel': fitnessLevel,
      'workoutStreak': workoutStreak,
      'totalXp': totalXp,
      'currentLevel': currentLevel,
    };
  }

  // Recontructs a Member object from data stored in shared_preferences.
  factory Member.fromMap(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      fitnessLevel: json['fitnessLevel'] as String,
      workoutStreak: json['workoutStreak'] as int,
      totalXp: json['totalXp'] as int,
      currentLevel: json['currentLevel'] as int,
    );
  }
}
