import 'package:flutter/material.dart';

import '../logic/stopwatch_state.dart';

class StopwatchControls extends StatelessWidget {
  const StopwatchControls({
    super.key,
    required this.state,
    required this.start,
    required this.stop,
    required this.reset,
  });

  final void Function() start;
  final void Function() stop;
  final void Function() reset;
  final StopwatchState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StopwatchState.initial:
        return _buildInitialPanel();
      case StopwatchState.started:
        return _buildStartedPanel();
      case StopwatchState.paused:
        return _buildPausedPanel();
    }
  }

  Widget _buildActionButton({
    required IconData iconData,
    required void Function() onPressed,
    double? size,
    required bool isAvailable,
  }) {
    return IconButton(
      icon: Icon(
        iconData,
        size: size ?? 35.0,
      ),
      color: isAvailable ? Colors.orange : Colors.grey,
      onPressed: isAvailable
          ? () {
              onPressed();
            }
          : null,
    );
  }

  Widget _buildActionPanel({
    required bool isStartAvailable,
    required bool isResetAvailable,
    required bool isAddingResultAvailable,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          iconData: Icons.add,
          onPressed: () {},  // TODO: implement saveResult,
          isAvailable: isResetAvailable,
        ),
        const SizedBox(width: 32.0),
        isStartAvailable
            ? _buildActionButton(
                iconData: Icons.play_arrow_rounded,
                onPressed: start,
                isAvailable: isStartAvailable,
                size: 70.0)
            : _buildActionButton(
                iconData: Icons.pause_circle_outlined,
                onPressed: stop,
                isAvailable: !isStartAvailable,
                size: 70.0),
        const SizedBox(width: 32.0),
        _buildActionButton(
          iconData: Icons.restart_alt_outlined,
          onPressed: reset,
          isAvailable: isResetAvailable,
        ),
      ],
    );
  }

  Widget _buildInitialPanel() {
    return _buildActionPanel(
      isAddingResultAvailable: false,
      isResetAvailable: false,
      isStartAvailable: true,
    );
  }

  Widget _buildStartedPanel() {
    return _buildActionPanel(
      isAddingResultAvailable: true,
      isResetAvailable: false,
      isStartAvailable: false,
    );
  }

  Widget _buildPausedPanel() {
    return _buildActionPanel(
      isAddingResultAvailable: false,
      isResetAvailable: true,
      isStartAvailable: true,
    );
  }
}
