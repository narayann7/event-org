import 'package:event_org/controller/api_services.dart';
import 'package:event_org/model/Events.dart';
import 'package:event_org/model/event_state.dart';
import 'package:event_org/utility/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventState.initial());

  Future<void> getEvents() async {
    emit(state.copyWith(status: STATUS.loading));
    try {
      var result = await ApiService.getAllEvents();
      if (result is Events) {
        emit(state.copyWith(status: STATUS.success, events: result));
      } else if (result is String) {
        emit(state.copyWith(status: STATUS.error, error: result));
      }
    } catch (e) {
      emit(state.copyWith(status: STATUS.error, error: e.toString()));
    }
  }
}
