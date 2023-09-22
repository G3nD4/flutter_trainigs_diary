import 'package:flutter/material.dart';
import 'package:sport_app/trainings/screens/training_plan_screen.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

class TrainingContainerWidget extends StatelessWidget {
  final TrainingPlan training;

  const TrainingContainerWidget({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    final double heightMultiplier = training.description == null ? 0.12 : 0.2;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * heightMultiplier,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color.fromRGBO(100, 100, 100, 1))),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainingPlanScreen(training: training,),
            ),
          );
        },
        elevation: 1.0,
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
    );
  }
}
