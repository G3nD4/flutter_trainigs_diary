import 'package:flutter/material.dart';
import 'package:trainings_diary/utils/services/editing.dart';

import '../../utils/models/exercise_model.dart';
import 'exercise_edit_dialog.dart';

class ExerciseWidget extends StatefulWidget {
  final Exercise exercise;
  final void Function(Exercise exercise) updateExercise;
  final void Function(Exercise exercise) deleteExercise;

  const ExerciseWidget(
      {super.key, required this.exercise, required this.updateExercise, required this.deleteExercise});

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) => ExerciseEditDialog(
              exercise: widget.exercise,
            ),
          ).then(
            (exercise) {
              if (exercise != null) {
                widget.updateExercise(exercise);
              }
            },
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.exercise.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.exercise.description != null)
                        Text(widget.exercise.description!, maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      if (await showSubmissionDialog(context, text: 'Are you sure you want to delete this exercise?')) {
                        widget.deleteExercise(widget.exercise);
                      }
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
