part of 'trainings_bloc.dart';

abstract class TrainingsState {}

class TrainingsInitial extends TrainingsState {}

class TrainingsLoading extends TrainingsState {}

class TrainingsLoaded extends TrainingsState {
  final List<TrainingPlan> trainings;

  TrainingsLoaded(this.trainings);
}
