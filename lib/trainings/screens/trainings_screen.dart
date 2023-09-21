import 'package:flutter/material.dart';
import 'package:sport_app/trainings/screens/add_training_screen.dart';
import 'package:sport_app/trainings/widgets/no_trainings.dart';
import 'package:sport_app/trainings/widgets/title.dart';
import 'package:sport_app/trainings/widgets/training_widget.dart';

import '../../utils/models/training_plan_model.dart';
import '../../utils/services/preferences_service.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TrainingPlanTitle(),
          FutureBuilder(
            future: getTrainings(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (!snapshot.hasData) {
                    return const Center(child: NoTrainingsText());
                  }
                  List<TrainingPlan> trainings = snapshot.data ?? [];
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TrainingContainerWidget(
                          training: trainings[index],
                        );
                      },
                    ),
                  );
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
      floatingActionButton: IconButton(
        iconSize: 64.0,
        icon: const Icon(
          Icons.add_circle,
          color: Colors.orange,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTrainingDart(),
            ),
          );
        },
      ),
    );
  }
}
