import 'package:flutter/material.dart';
import 'package:sport_app/common_widgets/common_appbar.dart';

class AddTrainingDart extends StatefulWidget {
  const AddTrainingDart({super.key});

  @override
  State<AddTrainingDart> createState() => _AddTrainingDartState();
}

class _AddTrainingDartState extends State<AddTrainingDart> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'New training',
        needLeadingPopBack: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _titleController,
          )
        ],
      ),
    );
  }
}
