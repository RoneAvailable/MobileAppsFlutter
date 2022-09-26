part of 'job_pending_bloc.dart';

@immutable
abstract class JobPendingEvent {}

class FetchData extends JobPendingEvent {}
