import 'package:flutter/material.dart';
import 'package:sport_app/trainings/screens/exercise_details_screen.dart';
import 'package:sport_app/utils/models/exercise_model.dart';

class ExerciseDetails extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetails({super.key, required this.exercise});

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        surfaceTintColor: Colors.orange,
        elevation: 1.0,
        child: SizedBox(
          width: screenSize.width * 0.9,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExerciseDetailsScreen(exercise: widget.exercise),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exercise.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      if (widget.exercise.description != null)
                        Text(
                          widget.exercise.description!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
