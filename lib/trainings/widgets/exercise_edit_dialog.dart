import 'package:flutter/material.dart';
import 'package:sport_app/utils/models/exercise_model.dart';

class ExerciseEditDialog extends StatefulWidget {
  const ExerciseEditDialog({super.key});

  @override
  State<ExerciseEditDialog> createState() => _ExerciseEditDialogState();
}

class _ExerciseEditDialogState extends State<ExerciseEditDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Title...'),
            controller: _titleController,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration:
                const InputDecoration(hintText: 'I need this exercise to...'),
            controller: _descriptionController,
          ),
          const SizedBox(height: 8.0),
          MaterialButton(
            onPressed: () {
              if (context.mounted) {
                Navigator.pop(
                  context,
                  Exercise(
                    title: _titleController.text,
                    description: _descriptionController.text,
                  ),
                );
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}
