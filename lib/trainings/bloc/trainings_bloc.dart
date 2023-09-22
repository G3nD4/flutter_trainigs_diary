import 'package:bloc/bloc.dart';
import 'package:sport_app/utils/models/training_plan_model.dart';
import 'package:sport_app/utils/services/preferences_service.dart';

part 'trainings_event.dart';
part 'trainings_state.dart';

class TrainingsBloc extends Bloc<TrainingsEvent, TrainingsState> {
  late final List<TrainingPlan> trainings;

  TrainingsBloc() : super(TrainingsInitial()) {
    on<TrainingsLoadEvent>(_loadTrainings);
    on<AddTrainingEvent>(_addTraining);
  }

  void _loadTrainings(TrainingsLoadEvent event, Emitter<TrainingsState> emit) async {
    emit(TrainingsLoading());
    trainings = await getTrainings() ?? [];
    emit(TrainingsLoaded(trainings));
  }

  void _addTraining(AddTrainingEvent event, Emitter<TrainingsState> emit) async {
    emit(TrainingsLoading());
    trainings.add(event.training);
    await updateTrainings(trainings);
    emit(TrainingsLoaded(trainings));
  }
}
