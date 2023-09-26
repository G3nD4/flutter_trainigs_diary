import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';
import 'package:sport_app/trainings/widgets/exercise_edit_dialog.dart';
import 'package:sport_app/trainings/widgets/exercise_widget.dart';
import 'package:sport_app/utils/models/exercise_model.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';
import 'package:sport_app/utils/services/editing.dart';

class EditTrainingScreen extends StatefulWidget {
  final TrainingPlan? training;

  const EditTrainingScreen({super.key, this.training});

  @override
  State<EditTrainingScreen> createState() => _EditTrainingScreenState();
}

class _EditTrainingScreenState extends State<EditTrainingScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late String _title;
  String? _description;
  final List<Exercise> _exercises = [];
  bool isDataValid = false;

  @override
  void initState() {
    super.initState();
    _title = widget.training?.title ?? '';
    _titleController = TextEditingController(text: widget.training?.title);
    _description = widget.training?.description;
    _descriptionController =
        TextEditingController(text: widget.training?.description);
    _exercises.addAll(widget.training?.exercises ?? []);
    isDataValid = _title != '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title:
            widget.training == null ? 'New training' : widget.training!.title,
        needLeadingPopBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Title...',
              ),
              validator: (text) {
                if (text == '' && text != null) return 'Title cannot be empty!';
                return null;
              },
              controller: _titleController,
              onChanged: (value) {
                _title = value;
                setState(() {
                  isDataValid = value != '';
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'This training will help me to...'),
              controller: _descriptionController,
              onChanged: (value) {
                _description = value;
              },
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ExerciseWidget(exercise: _exercises[index], updateExercise: (Exercise newExercise) {
                  setState(() {
                    _exercises[index] = newExercise;
                  });
                });
              },
              itemCount: _exercises.length,
            ),
            MaterialButton(
              onPressed: () async {
                Exercise? exercise = await createExercise(context);
                if (exercise != null) {
                  setState(() {
                    _exercises.add(exercise);
                  });
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.orange),
                  Text(
                    'Add exercise',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: isDataValid ? _submitTraining : null,
              child: Text(
                'Save',
                style: TextStyle(
                  color: isDataValid ? Colors.orange : Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitTraining() {
    Navigator.pop(
      context,
      TrainingPlan(
        title: _title,
        description: _description,
        exercises: _exercises,
      ),
    );
  }
}
