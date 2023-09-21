import 'package:flutter/material.dart';

class NoTrainingsText extends StatelessWidget {
  const NoTrainingsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'You have no training plans yet...',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Add one now!',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
