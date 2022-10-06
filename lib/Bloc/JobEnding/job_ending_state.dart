part of 'job_ending_bloc.dart';

@immutable
abstract class JobEndingState {}

class JobEndingInitial extends JobEndingState {}

class JobEndingWaiting extends JobEndingState {}

class JobEndingSuccess extends JobEndingState {
  late List<DetailModel> endingModel;

  JobEndingSuccess({required this.endingModel});
}

class JobEndingError extends JobEndingState {
  late String errorMessage;

  JobEndingError({required this.errorMessage});
}
