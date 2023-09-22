import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';
import 'package:sport_app/utils/models/exercise_model.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';

class EditTrainingScreen extends StatefulWidget {
  const EditTrainingScreen({super.key});

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
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
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
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'This training will help me to...'),
              controller: _descriptionController,
              onChanged: (value) {
                _description = value;
              },
            ),
            MaterialButton(
              onPressed: () {
                if (context.mounted) {
                  Navigator.pop(context, TrainingPlan(
                    title: _title,
                    description: _description,
                    exercises: _exercises,
                  ),);
                }
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
