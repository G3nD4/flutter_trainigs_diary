import 'package:flutter/material.dart';
import 'package:sport_app/utils/models/exercise_model.dart';

class ExerciseEditDialog extends StatefulWidget {
  final Exercise? exercise;

  const ExerciseEditDialog({super.key, this.exercise});

  @override
  State<ExerciseEditDialog> createState() => _ExerciseEditDialogState();
}

class _ExerciseEditDialogState extends State<ExerciseEditDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  bool isDataValid = false;

  @override
  void initState() {
    super.initState();
    // TODO: add initialization (of what?)
    _titleController = TextEditingController(text: widget.exercise?.title ?? '');
    _descriptionController = TextEditingController(text: widget.exercise?.description ?? '');
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
            onChanged: (value) {
              setState(() {
                isDataValid = value != '';
              });
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration:
                const InputDecoration(hintText: 'I need this exercise to...'),
            controller: _descriptionController,
          ),
          const SizedBox(height: 8.0),
          MaterialButton(
            onPressed: isDataValid ? _addExercise : null,
            child: Text(
              'Save',
              style: TextStyle(
                color: isDataValid ? Colors.orange : Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addExercise() {
    Navigator.pop(
      context,
      Exercise(
        title: _titleController.text,
        description: _descriptionController.text,
      ),
    );
  }
}
