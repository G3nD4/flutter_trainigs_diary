import 'package:flutter/material.dart';
import 'package:trainings_diary/utils/models/training_plan_model.dart';

import '../../utils/models/exercise_model.dart';
import '../../utils/services/editing.dart';
import '../bloc/trainings_bloc.dart';
import '../widgets/exercise_details_widget.dart';
import 'edit_training_screen.dart';

class TrainingPlanScreen extends StatelessWidget {
  final TrainingPlan training;
  final TrainingsBloc trainingsBloc;
  final int index;

  const TrainingPlanScreen({
    super.key,
    required this.training,
    required this.trainingsBloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Training plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              if (await showSubmissionDialog(
                context,
                text: 'Are you sure you want to delete this training?',
              )) {
                trainingsBloc.add(DeleteTrainingEvent(index));
                if (context.mounted) Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              training.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              training.description ?? 'Description not provided',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Exercises',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (Exercise exercise in training.exercises ?? [])
                    ExerciseDetails(exercise: exercise)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTrainingScreen(
                  training: training,
                ),
              ),
            ).then((newTraining) {
              if (newTraining != null) {
                trainingsBloc.add(UpdateTrainingEvent(index, newTraining));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrainingPlanScreen(
                      training: newTraining,
                      index: index,
                      trainingsBloc: trainingsBloc,
                    ),
                  ),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
