import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:NERubber/Model/DetailModel.dart';
import '../Services/NetworkServices.dart';

part 'job_ending_event.dart';
part 'job_ending_state.dart';

class JobEndingBloc extends Bloc<JobEndingEvent, JobEndingState> {
  JobEndingBloc() : super(JobEndingInitial()) {
    on<JobEndingEvent>((event, emit) {});

    //EndingData
    on<EndingEvent>((event, emit) async {
      emit(JobEndingWaiting());
      try {
        emit(
          JobEndingSuccess(
              endingModel: await NetworkServices().endingModelData(
                  event.Scalenumber,
                  event.dismoney,
                  event.dispercent,
                  event.remark)),
        );
      } catch (ex) {
        emit(JobEndingError(errorMessage: ex.toString()));
      }
    });
  }
}
