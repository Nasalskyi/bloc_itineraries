import 'dart:async';

import 'package:bloc/bloc.dart';

import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final _nameController = StreamController<String>();
  Stream<String> get nameStream => _nameController.stream;
  final _emailController = StreamController<String>();
  BookingBloc() : super(BookingState().init()) {
    on<InitEvent>(_init);

  }

  void _init(InitEvent event, Emitter<BookingState> emit) async {
    emit(state.clone());
  }
  dispose() {
    _nameController.close();
  }
}
