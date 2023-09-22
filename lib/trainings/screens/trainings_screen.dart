import 'package:flutter/material.dart';
import 'package:sport_app/trainings/bloc/trainings_bloc.dart';
import 'package:sport_app/trainings/widgets/no_trainings.dart';
import 'package:sport_app/trainings/widgets/title.dart';
import 'package:sport_app/trainings/widgets/training_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_training_screen.dart';

class TrainingsScreen extends StatefulWidget {
  const TrainingsScreen({super.key});

  @override
  State<TrainingsScreen> createState() => _TrainingsScreenState();
}

class _TrainingsScreenState extends State<TrainingsScreen> {
  late final TrainingsBloc trainingsBloc;

  @override
  void initState() {
    super.initState();
    trainingsBloc = TrainingsBloc()..add(TrainingsLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => trainingsBloc,
        child: BlocBuilder<TrainingsBloc, TrainingsState>(
          builder: (context, state) {
            if (state is TrainingsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TrainingsLoaded) {
              if (state.trainings.isEmpty) {
                return const Center(child: NoTrainingsText());
              }
              return CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => TrainingContainerWidget(
                        training: state.trainings[index],
                      ),
                      childCount: state.trainings.length,
                    ),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: IconButton(
        iconSize: 64.0,
        icon: const Icon(
          Icons.add_circle,
          color: Colors.orange,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditTrainingScreen(),
            ),
          ).then(
            (value) async {
              if (value != null) {
                trainingsBloc.add(AddTrainingEvent(value));
              }
            },
          );
        },
      ),
    );
  }
}
