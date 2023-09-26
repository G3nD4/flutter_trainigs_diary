import 'package:flutter/material.dart';

import '../../utils/models/training_plan_model.dart';
import '../bloc/trainings_bloc.dart';
import '../screens/training_plan_screen.dart';

class TrainingContainerWidget extends StatelessWidget {
  final TrainingPlan training;
  final int index;
  final TrainingsBloc trainingsBloc;

  const TrainingContainerWidget({super.key, required this.training, required this.index, required this.trainingsBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      // color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 4.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainingPlanScreen(training: training, trainingsBloc: trainingsBloc, index: index),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      training.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (training.description != null)
                      Text(
                        training.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 129, 129, 129),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
