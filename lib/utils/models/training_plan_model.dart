import 'exercise_model.dart';

class TrainingPlan {
  final String title;
  final String? description;
  final List<Exercise>? exercises;

  TrainingPlan({required this.title, this.description, this.exercises});

  factory TrainingPlan.fromJson(Map<String, dynamic> json) {
    return TrainingPlan(
      title: json['title'],
      description: json['description'],
      exercises: json['exercises'] == null
          ? null
          : (json['exercises'] as List<Map<String, dynamic>>)
              .map((exercise) => Exercise.fromJson(exercise))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'exercises': exercises == null
          ? null
          : exercises!.map((exercise) => exercise.toJson()).toList(),
      'type': 'training_plan',
    };
  }
}
