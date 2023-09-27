import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainings_diary/trainings/screens/training_plan_without_redaction.dart';

import '../../utils/models/training_plan_model.dart';
import '../cubit/dated_trainings_cubit.dart';
import 'add_dated_trainings.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late final DatedTrainingsCubit datedTrainingsCubit;

  @override
  void initState() {
    super.initState();
    datedTrainingsCubit = DatedTrainingsCubit();
    datedTrainingsCubit.loadTrainings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => datedTrainingsCubit,
        child: BlocBuilder<DatedTrainingsCubit, DatedTrainingsState>(
          builder: (context, state) {
            if (state is DatedTrainingsLoading) {
              return const Center(child: Text('No trainings are marked yet'));
            }
            if (state is DatedTrainingsLoaded) {
              if (state.trainings.isEmpty) {
                return const Center(child: Text('No trainings available'));
              }
              List<Widget> trainingWidgets =
                  buildDatedTrainings(state.trainings);
              return CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => trainingWidgets[index],
                      childCount: trainingWidgets.length,
                    ),
                  )
                ],
              );
            }
            return const Center(child: Text('No trainings are marked yet'));
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
              builder: (context) => const AddDatedTrainings(),
            ),
          ).then(
            (value) {
              if (value != null) {
                datedTrainingsCubit.updateTrainings(value);
              }
            },
          );
        },
      ),
    );
  }

  List<Widget> buildDatedTrainings(List<TrainingPlan> datedTrainings) {
    List<Widget> result = [];
    for (List<TrainingPlan> trainings in _getSortedTrainins(datedTrainings)) {
      result.add(
        Card(
          color: Colors.white,
          surfaceTintColor: Colors.orange,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainings.first.getDate()!,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const Divider(thickness: 1.0),
                  for (TrainingPlan training in trainings)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TrainingPlanWithounRedactionScreen(
                                    training: training,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      training.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    if (training.description != null)
                                      Text(
                                        training.description!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return result;
  }

  List<List<TrainingPlan>> _getSortedTrainins(List<TrainingPlan> trainings) {
    List<List<TrainingPlan>> result = [];
    int currentIndex = 0;

    for (int i = trainings.length - 1; i >= 0; --i) {
      if (trainings[i].date == null) continue;
      if (result.length == currentIndex) {
        result.add([]);
        result[currentIndex].add(trainings[i]);
        continue;
      }
      if (result[currentIndex].isEmpty) {
        result[currentIndex].add(trainings[i]);
        continue;
      }
      if (result[currentIndex].first.getDate() == trainings[i].getDate()) {
        result[currentIndex].add(trainings[i]);
        continue;
      }
      currentIndex += 1;
      result.add([]);
      result[currentIndex].add(trainings[i]);
    }

    return result;
  }
}
