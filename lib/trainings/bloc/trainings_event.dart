part of 'trainings_bloc.dart';

abstract class TrainingsEvent {}

class TrainingsLoadEvent extends TrainingsEvent {}

class AddTrainingEvent extends TrainingsEvent {
  final TrainingPlan training;

  AddTrainingEvent(this.training);
}
