class Exercise {
  final String id;
  final String name;
  final String category;
  final int sets;
  final int reps;
  final int duration;
  final double caloriesBurned;

  const Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.sets,
    required this.reps,
    required this.duration,
    required this.caloriesBurned,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'sets': sets,
      'reps': reps,
      'duration': duration,
      'caloriesBurned': caloriesBurned,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? 'General',
      sets: (json['sets'] as num?)?.toInt() ?? 3,
      reps: (json['reps'] as num?)?.toInt() ?? 12,
      duration: (json['duration'] as num?)?.toInt() ?? 5,
      caloriesBurned: (json['caloriesBurned'] as num?)?.toDouble() ?? 50,
    );
  }
}
