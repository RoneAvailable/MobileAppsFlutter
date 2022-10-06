import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Model/DetailModel.dart';
import '../Services/NetworkServices.dart';

part 'job_detail_event.dart';
part 'job_detail_state.dart';

class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  JobDetailBloc() : super(JobDetailInitial()) {
    on<JobDetailEvent>((event, emit) {});

    //FetchDataDetail
    on<FetchDataDetail>((event, emit) async {
      emit(JobDetailWaiting());
      try {
        emit(
          JobDetailSuccess(
            detailModel:
                await NetworkServices().detailModelData(event.Scalenumber),
          ),
        );
      } catch (ex) {
        emit(JobDetailError(errorMessage: ex.toString()));
      }
    });
  }
}
