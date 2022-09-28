part of 'job_pending_bloc.dart';

@immutable
abstract class JobPendingEvent {}

class FetchData extends JobPendingEvent {}

class FilterData extends JobPendingEvent {
  late String word;

  FilterData({required this.word});
}
