import 'package:flutter/material.dart';

import '../../trainings/widgets/exercise_edit_dialog.dart';
import '../models/exercise_model.dart';

Future<Exercise> editExercise(BuildContext context, Exercise exercise) async {
  return await showModalBottomSheet(
        context: context,
        builder: (context) => const ExerciseEditDialog(),
      ) ??
      exercise;
}

Future<Exercise?> createExercise(BuildContext context) async {
  return await showModalBottomSheet(
        context: context,
        builder: (context) => const ExerciseEditDialog(),
      );
}
