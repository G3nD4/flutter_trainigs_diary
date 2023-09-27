import 'package:bloc/bloc.dart';

import '../../utils/models/training_plan_model.dart';
import '../../utils/services/preferences_service.dart';

part 'dated_trainings_state.dart';

class DatedTrainingsCubit extends Cubit<DatedTrainingsState> {
  final List<TrainingPlan> trainings = [];

  DatedTrainingsCubit() : super(DatedTrainingsLoading());
  
  void loadTrainings() async {
    emit(DatedTrainingsLoading());
    trainings.addAll(await getDatedTrainings() ?? []);
    emit(DatedTrainingsLoaded(trainings));
  }

  void updateTrainings(TrainingPlan newDatedTrainingPlan) async {
    trainings.add(newDatedTrainingPlan);
    await updateDatedTraining(trainings);
    emit(DatedTrainingsLoaded(trainings));
  }

  void deleteTraining(TrainingPlan training) async {
    trainings.remove(training);
    await updateDatedTraining(trainings);
    emit(DatedTrainingsLoaded(trainings));
  }
}
