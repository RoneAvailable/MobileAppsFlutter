part of 'job_detail_bloc.dart';

@immutable
abstract class JobDetailEvent {}

class FetchDataDetail extends JobDetailEvent {
  late String Scalenumber;

  FetchDataDetail({required this.Scalenumber});
}
