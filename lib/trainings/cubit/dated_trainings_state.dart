part of 'dated_trainings_cubit.dart';

abstract class DatedTrainingsState {}

class DatedTrainingsLoaded extends DatedTrainingsState {
  final List<TrainingPlan> trainings;

  DatedTrainingsLoaded(this.trainings);
}

class DatedTrainingsLoading extends DatedTrainingsState {}

class DatedTrainingsError extends DatedTrainingsState {}
