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

Future<bool> showSubmissionDialog(BuildContext context, {required String text}) async {
  bool? result = await showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Card(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
  return result == true;
}
