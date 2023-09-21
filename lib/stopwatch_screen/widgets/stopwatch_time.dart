import 'package:flutter/material.dart';

class StopwatchTime extends StatelessWidget {
  const StopwatchTime({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: const TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
