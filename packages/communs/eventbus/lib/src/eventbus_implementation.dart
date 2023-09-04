import 'dart:async';

class EventBus {
  EventBus._internal();
  static final EventBus _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final _bus = StreamController.broadcast();

  static emit(payload) {
    _singleton._bus.sink.add(payload);
  }

  static get listen => _singleton._bus.stream.listen;
}
