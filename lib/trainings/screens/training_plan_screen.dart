import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';
import 'package:sport_app/trainings/screens/edit_training_screen.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

class TrainingPlanScreen extends StatelessWidget {
  final TrainingPlan training;

  const TrainingPlanScreen({super.key, required this.training});

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
                builder: (context) => EditTrainingScreen(training: training,),
              ),
            );
          },
        ),
      ),
    );
  }
}
