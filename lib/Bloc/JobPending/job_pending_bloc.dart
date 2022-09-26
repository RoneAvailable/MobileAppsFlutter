import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Model/DetailModel.dart';
import '../../Model/Drc.dart';
import '../Services/NetworkServices.dart';

part 'job_pending_event.dart';
part 'job_pending_state.dart';

class JobPendingBloc extends Bloc<JobPendingEvent, JobPendingState> {
  JobPendingBloc() : super(JobPendingInitial()) {
    on<JobPendingEvent>((event, emit) {});

    on<FetchData>((event, emit) async {
      emit(JobPendingWaiting());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(
          JobPendingSuccess(
            detailModel: NetworkServices().detailModelData(),
            drcModelData: NetworkServices().drcModelData(),
          ),
        );
      } catch (ex) {
        emit(JobPendingError(errorMessage: ex.toString()));
      }
    });
  }
}
