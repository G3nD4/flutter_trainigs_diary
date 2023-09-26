import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/training_plan_model.dart';

/// Either replaces the existing training plan with given [trainingPlan], or creates new one.
Future<void> updateTrainingPlan(TrainingPlan trainingPlan) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(trainingPlan.title, jsonEncode(trainingPlan.toJson()));
}

/// Searches for training plan by given [trainingPlanTitle].
///
/// If there is one, it will be returned.
/// Otherwise, null will be returned.
Future<TrainingPlan?> getTrainingPlan({required String trainingPlanTitle}) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? trainingPlan = preferences.getString(trainingPlanTitle);
  if (trainingPlan == null) return null;
  return TrainingPlan.fromJson(jsonDecode(trainingPlan));
}

Future<void> updateTrainings(List<TrainingPlan> trainings) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setStringList(
    'trainings',
    trainings.map((trainingPlan) => jsonEncode(trainingPlan.toJson())).toList(),
  );
}

Future<List<TrainingPlan>?> getTrainings() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String>? trainings = preferences.getStringList('trainings');
  if (trainings == null) return null;
  return trainings
      .map((trainingPlan) => TrainingPlan.fromJson(jsonDecode(trainingPlan)))
      .toList();
}

Future<List<TrainingPlan>?> getDatedTrainings() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String>? trainings = preferences.getStringList('dated_trainings');
  if (trainings == null) return null;
  return trainings
      .map((trainingPlan) => TrainingPlan.fromJson(jsonDecode(trainingPlan)))
      .toList();
}

Future<void> addDatedTraining(List<TrainingPlan> trainings) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setStringList(
    'dated_trainings',
    trainings.map((trainingPlan) => jsonEncode(trainingPlan.toJson())).toList(),
  );
}
