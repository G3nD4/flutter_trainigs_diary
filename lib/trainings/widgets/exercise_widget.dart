import 'package:flutter/material.dart';
import 'package:sport_app/trainings/widgets/exercise_edit_dialog.dart';
import 'package:sport_app/utils/models/exercise_model.dart';

class ExerciseWidget extends StatefulWidget {
  final Exercise exercise;
  final void Function(Exercise exercise) updateExercise;

  const ExerciseWidget(
      {super.key, required this.exercise, required this.updateExercise});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.exercise.title),
                  if (widget.exercise.description != null)
                    Text(widget.exercise.description!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
