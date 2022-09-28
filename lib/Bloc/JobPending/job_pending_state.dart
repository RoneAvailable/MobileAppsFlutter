part of 'job_pending_bloc.dart';

@immutable
abstract class JobPendingState {}

class JobPendingInitial extends JobPendingState {}

class JobPendingWaiting extends JobPendingState {}

class JobPendingSuccess extends JobPendingState {
  late List<DrcModel> drcModelData;

  JobPendingSuccess({required this.drcModelData});
}

class JobPendingError extends JobPendingState {
  late String errorMessage;

  JobPendingError({required this.errorMessage});
}
