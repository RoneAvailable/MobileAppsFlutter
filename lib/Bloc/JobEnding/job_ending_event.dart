part of 'job_ending_bloc.dart';

@immutable
abstract class JobEndingEvent {}

class EndingEvent extends JobEndingEvent {
  late String Scalenumber;
  late String dismoney;
  late String dispercent;
  late String remark;

  EndingEvent(
      {required this.Scalenumber,
      required this.dismoney,
      required this.dispercent,
      required this.remark});
}
