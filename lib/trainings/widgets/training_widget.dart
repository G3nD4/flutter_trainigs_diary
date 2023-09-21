import 'package:flutter/material.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

class TrainingContainerWidget extends StatelessWidget {
  final TrainingPlan training;

  const TrainingContainerWidget({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          onPressed: () {
            // Navigator.push(context,
            // MaterialPageRoute(builder: builder));
          },
          elevation: 1.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(training.title),
              if (training.description != null) Text(training.description!),
            ]
          ),
        ),
      )
    );
  }
}