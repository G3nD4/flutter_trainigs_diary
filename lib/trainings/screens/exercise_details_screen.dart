import 'package:flutter/material.dart';

import '../../common_widgets/common_appbar.dart';
import '../../utils/models/exercise_model.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Exercise details',
        needLeadingPopBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              exercise.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(),
            exercise.description == null || exercise.description!.isEmpty
                ? const Text(
                    'Description not provided',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Text(
                    exercise.description!,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
