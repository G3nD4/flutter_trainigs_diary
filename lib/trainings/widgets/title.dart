import 'package:flutter/material.dart';

class TrainingPlanTitle extends StatelessWidget {
  const TrainingPlanTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Training plans',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        )
      )
    );
  }
}