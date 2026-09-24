class Workout {
  final String id;
  final String exerciseName;
  final String category;
  final int sets;
  final int reps;
  final int duration;
  final int caloriesBurned;
  final DateTime? completionDate;
  final bool isCompleted;

  const Workout({
    required this.id,
    required this.exerciseName,
    required this.category,
    required this.sets,
    required this.reps,
    required this.duration,
    required this.caloriesBurned,
    required this.completionDate,
    this.isCompleted = false,
  });

  // Converts workout information into JSON-compatible data
  // before storing locally.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exerciseName': exerciseName,
      'category': category,
      'sets': sets,
      'reps': reps,
      'duration': duration,
      'caloriesBurned': caloriesBurned,
      'completionDate': completionDate?.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  // Converts saved JSON data back into a Workout object.
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as String,
      exerciseName: json['exerciseName'] as String,
      category: json['category'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] as int,
      duration: json['duration'] as int,
      caloriesBurned: json['caloriesBurned'] as int,
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      isCompleted: json['isCompleted'] as bool ?? false,
    );
  }
}
