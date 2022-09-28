import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Model/DetailModel.dart';
import '../../Model/Drc.dart';
import '../Services/NetworkServices.dart';

part 'job_pending_event.dart';
part 'job_pending_state.dart';

class JobPendingBloc extends Bloc<JobPendingEvent, JobPendingState> {
  List<DrcModel> _modeldrc = [];
  JobPendingBloc() : super(JobPendingInitial()) {
    //JobPendingEvent
    on<JobPendingEvent>((event, emit) {});

    //FetchData
    on<FetchData>((event, emit) async {
      emit(JobPendingWaiting());
      // await Future.delayed(const Duration(seconds: 3));
      try {
        _modeldrc = await NetworkServices().drcModelData();
        emit(
          JobPendingSuccess(
            drcModelData: _modeldrc,
          ),
        );
      } catch (ex) {
        emit(JobPendingError(errorMessage: ex.toString()));
      }
    });

    //FilterData
    on<FilterData>((event, emit) async {
      var drcModel = _modeldrc
          .where((p) =>
              p.Name!.contains(event.word) ||
              p.Carlicense!.contains(event.word) ||
              p.Scalenumber!.contains(event.word))
          .toList();
      emit(JobPendingWaiting());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(
          JobPendingSuccess(
            drcModelData: drcModel,
          ),
        );
      } catch (ex) {
        emit(JobPendingError(errorMessage: ex.toString()));
      }
    });
  }
}
