part of 'job_detail_bloc.dart';

@immutable
abstract class JobDetailState {}

class JobDetailInitial extends JobDetailState {}

class JobDetailWaiting extends JobDetailState {}

class JobDetailSuccess extends JobDetailState {
  late List<DetailModel> detailModel;

  JobDetailSuccess({required this.detailModel});
}

class JobDetailError extends JobDetailState {
  late String errorMessage;

  JobDetailError({required this.errorMessage});
}
