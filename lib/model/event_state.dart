import 'package:event_org/model/Events.dart';
import 'package:event_org/utility/constants.dart';

class EventState {
  String error;
  STATUS status;
  Events events;
  EventState({
    required this.error,
    required this.status,
    required this.events,
  });
  factory EventState.initial() {
    return EventState(
      error: '',
      status: STATUS.initial,
      events: Events(),
    );
  }

  EventState copyWith({
    String? error,
    STATUS? status,
    Events? events,
  }) {
    return EventState(
      error: error ?? this.error,
      status: status ?? this.status,
      events: events ?? this.events,
    );
  }
}
