import 'exercise_model.dart';

class TrainingPlan {
  final String title;
  final String? description;
  final List<Exercise>? exercises;
  final DateTime? date;

  TrainingPlan({required this.title, this.description, this.exercises, this.date});

  String? getDate() {
    if (date == null) return null;
    DateTime dateTime = date!.toLocal();
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  factory TrainingPlan.fromJson(Map<String, dynamic> json) {
    return TrainingPlan(
      title: json['title'],
      date: DateTime.tryParse(json['date'] ?? ''),
      description: json['description'],
      exercises: json['exercises'] == null
          ? null
          : (json['exercises'] as List<dynamic>)
              .map((exercise) => Exercise.fromJson(exercise as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date?.toString(),
      'exercises': exercises == null
          ? null
          : exercises!.map((exercise) => exercise.toJson()).toList(),
      'type': 'training_plan',
    };
  }
}
