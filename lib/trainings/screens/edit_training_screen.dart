import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';
import 'package:sport_app/trainings/widgets/exercise_edit_dialog.dart';
import 'package:sport_app/utils/models/exercise_model.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

class EditTrainingScreen extends StatefulWidget {
  final TrainingPlan? training;

  const EditTrainingScreen({super.key, this.training});

  @override
  State<EditTrainingScreen> createState() => _EditTrainingScreenState();
}

class _EditTrainingScreenState extends State<EditTrainingScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  String _title = '';
  String? _description;
  final List<Exercise> _exercises = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.training?.title);
    _descriptionController =
        TextEditingController(text: widget.training?.description);
    _exercises.addAll(widget.training?.exercises ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'New training',
        needLeadingPopBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Title...'),
              controller: _titleController,
              onChanged: (value) {
                _title = value;
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
            MaterialButton(
              onPressed: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) => const ExerciseEditDialog());
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
              onPressed: () {
                if (context.mounted) {
                  Navigator.pop(
                    context,
                    TrainingPlan(
                      title: _title,
                      description: _description,
                      exercises: _exercises,
                    ),
                  );
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
