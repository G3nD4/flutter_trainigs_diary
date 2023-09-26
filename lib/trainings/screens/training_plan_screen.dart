import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';
import 'package:sport_app/trainings/bloc/trainings_bloc.dart';
import 'package:sport_app/trainings/screens/edit_training_screen.dart';
import 'package:sport_app/trainings/widgets/exercise_details_widget.dart';
import 'package:sport_app/utils/models/exercise_model.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

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
      appBar: const CommonAppBar(
        title: 'Training plan',
        needLeadingPopBack: true,
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
