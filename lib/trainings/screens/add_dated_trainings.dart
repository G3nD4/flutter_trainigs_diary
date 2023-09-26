import 'package:flutter/material.dart';

import '../../common_widgets/common_appbar.dart';
import '../../utils/models/training_plan_model.dart';
import '../../utils/services/preferences_service.dart';

class AddDatedTrainings extends StatelessWidget {
  const AddDatedTrainings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Trainings',
        needLeadingPopBack: true,
      ),
      body: FutureBuilder(
        future: getTrainings(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const Text('No trainings available');
              }
              return ListView(
                shrinkWrap: true,
                children: [
                  for (TrainingPlan training in snapshot.data!)
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              TrainingPlan(
                                title: training.title,
                                description: training.description,
                                exercises: training.exercises,
                                date: DateTime.now(),
                              ),
                            );
                          },
                          child: Text(training.title),
                        )
                      ],
                    )
                ],
              );
            default:
              return const Text('No trainings available');
          }
        },
      ),
    );
  }
}
