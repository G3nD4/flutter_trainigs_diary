import 'package:flutter/material.dart';
import 'package:sport_app/utils/models/exercise_model.dart';

import '../../trainings/widgets/exercise_edit_dialog.dart';

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
