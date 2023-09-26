import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/trainings_bloc.dart';
import '../widgets/no_trainings.dart';
import '../widgets/training_widget.dart';
import 'edit_training_screen.dart';

class TrainingsListScreen extends StatefulWidget {
  const TrainingsListScreen({super.key});

  @override
  State<TrainingsListScreen> createState() => _TrainingsListScreenState();
}

class _TrainingsListScreenState extends State<TrainingsListScreen> {
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
                        trainingsBloc: trainingsBloc,
                        training: state.trainings[index],
                        index: index,
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
