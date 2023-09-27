part of 'trainings_bloc.dart';

abstract class TrainingsEvent {}

class TrainingsLoadEvent extends TrainingsEvent {}

class AddTrainingEvent extends TrainingsEvent {
  final TrainingPlan training;

  AddTrainingEvent(this.training);
}

class UpdateTrainingEvent extends TrainingsEvent {
  final TrainingPlan training;
  final int index;

  UpdateTrainingEvent(this.index, this.training);
}

class DeleteTrainingEvent extends TrainingsEvent {
  final int index;

  DeleteTrainingEvent(this.index);
}
