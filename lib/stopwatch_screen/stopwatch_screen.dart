import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trainings_diary/stopwatch_screen/widgets/stopwatch_controls.dart';
import 'package:trainings_diary/stopwatch_screen/widgets/stopwatch_time.dart';

import 'logic/stopwatch_state.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _time = '00:00:00';
  StopwatchState _stopwatchState = StopwatchState.initial;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 0), () {});
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.reset();
    super.dispose();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      setState(() {
        _time =
            '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    _stopwatch.start();
    
    setState(() {
      _stopwatchState = StopwatchState.started;
    });
  }

  void _stop() {
    _timer.cancel();
    _stopwatch.stop();

    setState(() {
      _stopwatchState = StopwatchState.paused;
    });
  }

  void _reset() {
    _stop();
    _stopwatch.reset();
    _time = '00:00:00';

    setState(() {
      _stopwatchState = StopwatchState.initial;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StopwatchTime(
              time: _time,
            ),
            StopwatchControls(
              start: _start,
              stop: _stop,
              reset: _reset,
              state: _stopwatchState,
            )
          ],
        ),
      ),
    );
  }
}
